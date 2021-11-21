import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DS {
  static const Color genreSelected = Color.fromRGBO(0, 56, 76, 1);
  static const Color searchBarTextColor = Color.fromRGBO(94, 103, 112, 1);
  static const Color greyPrimaryColor = Color.fromRGBO(241, 243, 245, 1);
  static const Color greySecondaryColor = Color.fromRGBO(245, 245, 245, 1);
  static const Color goBackButtonTextColor = Color.fromRGBO(109, 112, 112, 1);
  static const Color ratingDefaultTextColor = Color.fromRGBO(134, 142, 150, 1);
  static const Color movieDetailTitleTextColor = Color.fromRGBO(52, 58, 64, 1);
  static const Color originalTitleTextColor = Color.fromRGBO(94, 103, 112, 1);

  static var appBarTitle = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static var searchBarText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: searchBarTextColor,
  );

  static var genreTextPill = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static var movieCardTitle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var genreCardTextTitle = GoogleFonts.montserrat(
    fontSize: 12.19,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static var goBackButtonText = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: goBackButtonTextColor,
  );

  static var ratingReceivedText = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: genreSelected,
  );

  static var ratingDefaultText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ratingDefaultTextColor,
  );

  static var movieDetailTitleText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: movieDetailTitleTextColor,
  );

  static var originalTitleTextLabel = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: originalTitleTextColor,
  );

  static var originalTitleText = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: originalTitleTextColor,
  );

  static var yearDurationTextLabel = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ratingDefaultTextColor,
  );

  static var yearDurationBudgetProducerText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: movieDetailTitleTextColor,
  );

  static var genreDetailText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: originalTitleTextColor,
  );

  static var descriptonDirectorCrewText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: searchBarTextColor,
  );

  static var movieOverviewDirectorCrewDetailText = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: movieDetailTitleTextColor,
  );

  static var budgetProducersText = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ratingDefaultTextColor,
  );
}
