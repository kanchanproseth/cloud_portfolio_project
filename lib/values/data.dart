part of 'values.dart';

class MenuData {
  MenuData({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class ProjectDetails {
  ProjectDetails({
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    this.technologyUsed,
    this.isPublic,
    this.isLive,
    this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool? isPublic;
  final bool? isOnPlayStore;
  final bool? isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class PortfolioData {
  PortfolioData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.subtitle,
    required this.portfolioDescription,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
  });

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    this.company,
    this.companyUrl,
  });

  final String? company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<MenuData> menuList = [
    MenuData(
      title: StringConst.ME,
      routeName: MePage.mePageRoute,
    ),
    MenuData(title: StringConst.RESUME, routeName: StringConst.RESUME),
    // MenuData(title: StringConst.ABOUT_ME, routeName: AboutPage.aboutPageRoute),
    MenuData(
      title: StringConst.PORTFOLIO,
      routeName: PortfolioPage.portfolioPageRoute,
    ),
    MenuData(
      title: StringConst.CERTIFICATIONS,
      routeName: CertificationPage.certificationPageRoute,
    ),
    MenuData(
      title: StringConst.CONTACT,
      routeName: ContactPage.contactPageRoute,
    ),
    // MenuData(
    //   title: StringConst.README,
    //   routeName: ReadMePage.readMePageRoute,
    // ),
  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 95, skillName: StringConst.IOS),
    SkillData(skillLevel: 95, skillName: StringConst.SWIFT),
    SkillData(skillLevel: 80, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 75, skillName: StringConst.JAVA),
    SkillData(skillLevel: 70, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 70, skillName: StringConst.KOTLIN),
    SkillData(skillLevel: 90, skillName: StringConst.SQL),
    SkillData(skillLevel: 90, skillName: StringConst.REACTIVEX),
    SkillData(skillLevel: 70, skillName: StringConst.HTML_CSS),
  ];

  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      content: StringConst.EDUCATION_TEXT,
    ),
  ];
  static List<PortfolioData> portfolioData = [
    PortfolioData(
      title: StringConst.HLB_APP,
      subtitle: StringConst.HLB_APP_SUBTITLE,
      image: FilePath.HONGLEONG,
      portfolioDescription: StringConst.HLB_APP_DETAIL,
      imageSize: 0.35,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.IOS,
      gitHubUrl: StringConst.HLB_APP_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.CBL,
      subtitle: StringConst.CBL_SUBTITLE,
      image: FilePath.CBL,
      portfolioDescription: StringConst.CBL_DETAIL,
      imageSize: 0.35,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.IOS,
      gitHubUrl: StringConst.CBL_GITHUB_URL,
      webUrl: StringConst.CBL_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.GLF,
      subtitle: StringConst.GLF_SUBTITLE,
      image: FilePath.GLF,
      portfolioDescription: StringConst.GLF_DETAIL,
      imageSize: 0.35,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.IOS,
      gitHubUrl: StringConst.GLF_GITHUB_URL,
    ),
    PortfolioData(
      title: StringConst.BIZ_CARD,
      subtitle: StringConst.BIZ_CARD_SUBTITLE,
      image: FilePath.BIZ,
      portfolioDescription: StringConst.BIZ_CARD_DETAIL,
      imageSize: 0.35,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.IOS,
      gitHubUrl: StringConst.BIZ_CARD_WEB_URL,
    )
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.GEEKLE_CT,
      url: DocumentPath.CERT_1,
      image: FilePath.CERT_1,
      imageSize: 0.30,
      awardedBy: StringConst.GEEKLE,
    ),
    CertificationData(
      title: StringConst.MICROSOFT_CT,
      url: DocumentPath.CERT_2,
      image: FilePath.CERT_2,
      imageSize: 0.30,
      awardedBy: StringConst.MICROSOFT,
    ),
    CertificationData(
      title: StringConst.EXHIBITION_CT_1,
      url: DocumentPath.CERT_3,
      image: FilePath.CERT_3,
      imageSize: 0.30,
      awardedBy: StringConst.IENVEX,
    ),
    CertificationData(
      title: StringConst.EXHIBITION_CT_2,
      url: DocumentPath.CERT_4,
      image: FilePath.CERT_3,
      imageSize: 0.30,
      awardedBy: StringConst.I2CREATE,
    )
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_5,
      position: StringConst.POSITION_5,
      companyUrl: StringConst.COMPANY_5_URL,
      roles: [
        StringConst.COMPANY_5_ROLE_1,
        StringConst.COMPANY_5_ROLE_2,
        StringConst.COMPANY_5_ROLE_3,
        StringConst.COMPANY_5_ROLE_4,
        StringConst.COMPANY_5_ROLE_5,
        StringConst.COMPANY_5_ROLE_6,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
        StringConst.COMPANY_4_ROLE_4,
        StringConst.COMPANY_4_ROLE_5,
        StringConst.COMPANY_4_ROLE_6,
        StringConst.COMPANY_4_ROLE_7,
        StringConst.COMPANY_4_ROLE_8,
        StringConst.COMPANY_4_ROLE_9,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.COMPANY_1_URL,
      roles: [
        StringConst.COMPANY_1_ROLE_1,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
