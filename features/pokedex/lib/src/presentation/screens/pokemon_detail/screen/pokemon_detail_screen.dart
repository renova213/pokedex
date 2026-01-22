import 'package:config/config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:pokedex/src/extension/extension.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/view_model/pokemon_detail_cubit.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/view_model/pokemon_detail_state.dart';
import 'package:pokedex/src/presentation/screens/pokemon_detail/widgets/widgets.dart';
import 'package:shared_components/shared_components.dart';

class PokemonDetailScreen extends StatefulWidget {
  final List<PokemonItemEntity> pokemonList;
  final PokemonItemEntity pokemon;
  final int index;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonList,
    required this.index,
    required this.pokemon,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state is PokemonDetailLoaded
              ? colorStringToType(state.pokemon.types.first.name)
              : Colors.white,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.blue, // WAJIB
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.blue, // Android
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            child: SafeArea(child: _buildBody(context, state)),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, PokemonDetailState state) {
    PokemonDetailCubit pokemonDetailCubit = context.read<PokemonDetailCubit>();

    if (state is PokemonDetailLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryRed),
      );
    }

    if (state is PokemonDetailError) {
      return Center(
        child: Text(
          state.message,
          style: TextStyleHelper.apply(size: .body1, style: .medium),
        ),
      );
    }

    if (state is PokemonDetailLoaded) {
      return GestureDetector(
        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;
          if (velocity < 0) {
            context.read<PokemonDetailCubit>().next();
          } else if (velocity > 0) {
            context.read<PokemonDetailCubit>().prev();
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: .topRight,
                  child: Image.asset(
                    AppAssets.images.pokeball,
                    package: AppAssets.pkg,
                    width: context.width * 0.6,
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: PokemonDetailInformation(
                      pokemonDetail: state.pokemon,
                    ),
                  ),
                ),
              ],
            ),

            SafeArea(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      PokemonDetailHeader(
                        onBack: () {
                          context.pop(context);
                        },
                        title: state.pokemon.name,
                        number: state.pokemon.id,
                      ),
                      PokemonDetailBanner(
                        onPrevious: pokemonDetailCubit.canGoPrev
                            ? pokemonDetailCubit.prev
                            : () {},
                        onNext: pokemonDetailCubit.canGoNext
                            ? pokemonDetailCubit.next
                            : () {},
                        imageUrl: state.pokemon.imageUrl,
                        canGoNext: pokemonDetailCubit.canGoNext,
                        canGoPrev: pokemonDetailCubit.canGoPrev,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
