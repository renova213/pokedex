import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/presentation/screens/dashboard/view_model/view_model.dart';
import 'package:shared_components/shared_components.dart';

class PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const PaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: currentPage > 1
                ? () => context.read<PokemonCubit>().prevPage()
                : null,
            child: const Text('Prev'),
          ),
          Text(
            'Page $currentPage of ${totalPage == 0 ? 1 : totalPage}',
            style: TextStyleHelper.apply(size: .body2, style: .semiBold),
          ),
          TextButton(
            onPressed: currentPage < totalPage
                ? () => context.read<PokemonCubit>().nextPage()
                : null,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
