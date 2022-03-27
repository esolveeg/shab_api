USE alshab_staging;

# categories
INSERT INTO
    categories (name, icon, type)
VALUES
    ('استثمار', 'domain', 'post'),
    (
        'القيادة',
        'account-multiple-plus-outline',
        'post'
    ),
    ('المالية', 'cash-multiple', 'post'),
    ('التقنية', 'desktop-classic', 'post'),
    (
        'ادارة',
        'human-greeting-variant',
        'post'
    ),
    (
        'اخري',
        'human-greeting-variant',
        'post'
    ),
    (
        'مستشفيات وعيادات',
        'hospital-building',
        'project'
    ),
    (
        'مطاعم وكافيهات',
        'silverware-fork-knife',
        'project'
    ),
    (
        'رياضة وترفيه',
        'run-fast',
        'project'
    ),
    (
        'مونتاج مرئي',
        'video-check-outline',
        'project'
    ),
    (
        'مدارس ومراكز تعليم',
        'school-outline',
        'project'
    ),
    (
        'اخري',
        'human-greeting-variant',
        'project'
    ),
    (
        'ورشة عمل',
        'hospital-building',
        'event'
    ),
    (
        'لقاء استشاري',
        'hospital-building',
        'event'
    ),
    (
        'لقاء اعمال - جدة',
        'hospital-building',
        'event'
    ),
    (
        'لقاء الرواد',
        'hospital-building',
        'event'
    ),
    (
        'اخري',
        'human-greeting-variant',
        'event'
    ),
    (
        'التنمية البشرية‬',
        'human-greeting-variant',
        'video'
    ),
    (
        '‫المالية‬',
        'human-greeting-variant',
        'video'
    ),
    (
        'الادارة',
        'human-greeting-variant',
        'video'
    ),
    (
        '‫التقنية‪،‬‬',
        'human-greeting-variant',
        'video'
    ),
    (
        '‫التسويق‬',
        'human-greeting-variant',
        'video'
    ),
    (
        'اخري',
        'human-greeting-variant',
        'video'
    )
    ;
# videos 
INSERT INTO
    videos(name, url, image , category_id)
VALUES
    (
        'حياة الكفاح - تجارب علمتني ح 1',
        'https://www.youtube.com/watch?v=a7sJ4MBtL2A',
        'assets/videos/01.webp',
        1
    ),
    (
        'حياة الكفاح - تجارب علمتني ح 2',
        'https://www.youtube.com/watch?v=2MiTWgoazy0',
        'assets/videos/02.webp',
        2

    ),
    (
        'اساسيات بناء وتأسيس المشاريع -  أ. احمد المنهبي',
        'https://www.youtube.com/watch?v=Zla7htgnf_g',
        'assets/videos/03.webp',
        3
    ),
    (
        'الشاب الريادي',
        'https://www.youtube.com/watch?v=j5K6Gb9lz5M',
        'assets/videos/04.webp',
        4
    ),
    (
        'حياة الكفاح - تجارب علمتني ح 2',
        'https://www.youtube.com/watch?v=2MiTWgoazy0',
        'assets/videos/02.webp',
        5

    ),
    (
        'حياة الكفاح - تجارب علمتني ح 1',
        'https://www.youtube.com/watch?v=a7sJ4MBtL2A',
        'assets/videos/01.webp',
        6
    );


# consultunts
INSERT INTO
    consultunts (`name`, `img`, `breif` , `title` , `skills`)
VALUES
    (
        'انس محمود الانصاري',
        'assets/members/male-02.jpg',
        'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا',
        'مستشار اقتصادي',
        'التخطيط,ادارة الاعمال,التسويق'
    ),
    (
        'رزان احسان الطويل',
        'assets/members/female-02.jpg',
        'وت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات',
        'مستشار اقتصادي',
        'التخطيط,ادارة الاعمال,التسويق'
    ),
    (
        'وليد عبد الواسع قوقندي',
        'assets/members/male-03.jpg',
        'ديواسأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايتنيولا باراياتيور لابورأس نيسي يت أليكيوب',
        'مستشار اقتصادي',
        'التخطيط,ادارة الاعمال,التسويق'
    ),
    (
        'احمد بن محمد السعيد',
        'assets/members/male-04.jpg',
        'ديواسأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايتنيولا باراياتيور لابورأس نيسي يت أليكيوب',
        'مستشار اقتصادي',
        'التخطيط,ادارة الاعمال,التسويق'
    );

    

# services
INSERT INTO
    services (name, icon)
VALUES
    (
        'تصميم موقع الكتروني',
        'application-outline'
    ),
    ('نموذج عمل', 'note-edit-outline'),
    ('استشارة اقتصادية', 'tune-vertical'),
    ('دراسة جدوي', 'equalizer');

# cities
INSERT INTO
    cities (`name`)
VALUES
    ("جدة"),
    ("الرياض"),
    ('الطائف'),
    ("مكة المكرمة"),
    ("المدينة المنورة"),
    ("املج"),
    ("الجبيل"),
    ("الدمام"),
    ("الخرج"),
    ("الليث"),
    ("بيشة"),
    ("بريدة"),
    ("الشرقية"),
    ("تبوك"),
    ("نجران"),
    ("شرورة"),
    ("جيزان"),
    ("تيماء"),
    ("الاحساء"),
    ("القصيم");


#rich text
INSERT INTO
    `rich_text` (
        `key`,
        `title`,
        `value`,
        `image`,
        `icon`,
        `group`
    )
VALUES
    (
        'banner',
        ' أفضل مجتمع أعمال حيوي ',
        '<strong>متفرد</strong> لتبادل الخبرات وتنمية المهارات',
        'assets/banner.png',
        NULL,
        0
    ),
    (
        'vision',
        'رؤيتنا',
        'أفضل مجتمع اعمال حيوي متفرد لرواد الاعمال واصحاب المشاريع',
        NULL,
        'mdi-eye-outline',
        1
    ),
    (
        'msg',
        'رسالتنا',
        'تمكين الشباب من تأسيس وتطوير مشاريع نوعية واعدة',
        NULL,
        'mdi-flag-outline',
        1
    ),
    (
        'mission',
        'مهمتنا',
        'تكوين مجتمع حيوي لتبادل أفضل الممارسات والشراكات',
        NULL,
        'mdi-bullseye-arrow',
        1
    ),
    (
        'values',
        'قيمنا',
        'بناء العلاقات واثراء المعرفة لتحقيق النجاح المشترك',
        NULL,
        'mdi-chart-box-outline',
        1
    ),
    (
        'small_business',
        NULL,
        'أصحاب المشاريع الناشئة والصغيرة',
        NULL,
        'apartment',
        2
    ),
    (
        'ideas',
        NULL,
        'أصحاب الأفكار الخلاقة والواعدة ',
        NULL,
        'tungsten',
        2
    ),
    (
        'students',
        NULL,
        'طلاب الإدارة والاقتصاد وريادة الاعمال',
        NULL,
        'add_business',
        2
    ),
    (
        'business_men',
        NULL,
        'المهتمين بمجال المال والأعمال وريادة الاعمال',
        NULL,
        'admin_panel_settings',
        2
    ),
    (
        'business_men',
        NULL,
        'الباحثين عن تأسيس مشاريعهم التجارية',
        NULL,
        'assistant_photo',
        2
    );

# features
INSERT INTO
    features(`name`, `breif`, `level`)
VALUES
    
    (
            "مجتمع تفاعلي",
            "منصة تفاعلية رقمية بين الأعضاء المنتمين للعضوية لاستفادة من الخبرات والتجارب",
            0
        ),
        (
            "الاتصالات التنفيذية",
            "الالتقاء والتواصل بين الأعضاء لتبادل المعارف والخبرات ومناقشة التحديات ",
            0
        ),
        (
            "مدونة الاعمال",
            "امكانية الوصول الى المحتوى النصي الرقمي المميز في مجالات الإدارة وتقنية المعلومات",
            0
        ),
        (
            "تمييز العضو",
            "تمييز العضو بعرض بياناته على المنصة بحسب فئة العضوية المنتمي اليها",
            0
        ),
        (
            "شهادات حضور",
            "منح شهادات حضور الفعاليات معتمدة من Business Pro برقم تسلسلي موثق للمرجعية",
            0
        ),
        (
            " عضوية الكترونية",
            "إصدار بطاقة عضوية الكترونية للمشترك عبر المنصة موثقة برقم تسلسلي مع كتابة الاسم باللغتين ( ع - E ) للعضو بشكل تلقائي",
            0
        ),
        (
            "عضوية مطبوعة",
            "إصدار بطاقة عضوية مطبوعة برسوم مخفضة للعضو عند الطلب موثقة برقم تسلسلي مع كتابة الاسم باللغتين ( ع - E )",
            0
        ),
        (
            "شبكة تواصل",
            " الالتقاء والتواصل بمجتمع أعضاء الشاب الريادي لتكوين علاقات قوية تساهم في نمو أعمالك",
            0
        ),
        (
            "برامج نوعية",
            "تقديم برامج ولقاءات نوعية خلال مدة زمنية سنوياً تساهم في تأسيس وتطوير واطلاق المشاريع بخصومات محددة حسب كل عضوية",
            0
        ),
        (
            "ورش عمل",
            "ورش عمل تطبيقية تساهم في تنمية مهارات الاعمال لدى الاعضاء بأسعار رمزية",
            0
        ),
        (
            "المحتوى الرقمي",
            "الاطلاع على المحتوى (النصي - المرئي - الصوتي ) الخاص بالـمنصة للاتجاهات  الحالية والإستراتيجيات المستقبلية في مجال المال والاعمال",
            0
        ),
        (
            "الفعاليات الافتراضية",
            "حضور ندوات ولقاءات افتراضية تساهم في زيادة الوعي بأهم المواضيع في ريادة الاعمال",
            0
        ),
        (
            "جلسات استشارية",
            "جلسات استشارية دورية ( افتراضية - حضورية ) تساعد الأعضاء على حل مشاكلهم التجارية مجانية و برسوم مخفضة",
            0
        ),
        (
            "معسكرات خارجية",
            "معسكرات تطبيقية بقاعات فندقية راقية تقدم بأسعار رمزية حسب نوع العضوية تساعد الأعضاء من تأسيس وتطوير ونمو مشاريعهم",
            0
        ),
        (
            "نقاط مكتسبة",
            "منح نقاط مكتسبة لاكتساب خصمومات على الخدمات المقدمة في منصة الشاب الريادي او مع احد شركائنا",
            0
        ),
        (
            "نشرة اعمال",
            "نشرة اعمال دورية تحتوي على اهم المعارف والخبرات وعرض المشاريع الناجحة في مجال ريادة الاعمال",
            1
        ),
        (
            "كتابة مقالات",
            "تمكين العضو من كتابة محتوى نصي عبر مدونة الاعمال الرقمية مع اظهار اسم وصورة العضو حسب السياسات والشروط",
            1
        ),
        (
            "العلاقات الافتراضية",
            " التواصل الهادف والحصري مع مجتمع المال والاعمال افتراضياً",
            1
        ),
        (
            "جلسة نقاشات",
            " جلسة عصف ذهني لمناقشة القضايا والمشاكل للخروج بتوصيات اصلاحية لقطاع المال والاعمال",
            1
        ),
        (
            "نماذج عمل",
            "الحصول على نماذج عمل تطبيقية تساعد في بناء وتطوير وتأسيس المشاريع الصغيرة والمتوسطة",
            1
        ),
        (
            "رحلة بزنس",
            "رحلة لأهم المناطق التجارية المحلية والإقليمية والعالمية لتبادل الخبرات واكتساب التجارب برسوم مخفضة",
            1
        ),
        (
            "خطط ودراسات",
            "عمل وتصميم الخطط والدراسات للمشاريع برسوم مخفضة",
            1
        ),
        (
            "الملتقى السنوي",
            "حضور الملتقى السنوي لريادة الاعمال بين الأعضاء لتكوين الشراكات الاستراتيجية وتبادل المعارف والخبرات بأسعار رمزية",
            1
        ),
        (
            "الدعوات الخاصة",
            "دعوة العضو بشكل خاص لحضور بعض فعالياتنا الخاصة  او فعاليات شركائنا الخاصة",
            1
        ),
        (
            "الشبكة التنفيذية",
            "شبكة اعمال تنفيذية تساهم في تكوين شراكات وتحالفات واستثمارات استراتيجية بين الأعضاء ورواد الأعمال من خلال تجمعات دورية",
            2
        ),
        (
            "الملتقيات والمؤتمرات",
            "ملتقيات ومؤتمرات بأسعار رمزية للمساهمة في زيادة الوعي وتبادل الخبرات والتواصل مع مجتمع المال والاعمال",
            2
        ),
        (
            "عرض المشاريع",
            "عرض مشاريع الأعضاء في صفحة مستقلة بالمنصة بهدف عقد شراكات وتحالفات واستثمار مع قادة المال والاعمال",
            2
        ),
        (
            "لقاءات التنفيذيين",
            "لقاء مع الرؤساء التنفيذيين في قطاع المال والاعمال لعرض التجارب والفرص لرواد الاعمال",
            2
        ),
        (
            "لقاءات Vip",
            "لقاءات VIP خاصة مع قادة المال والاعمال",
            2
        ),
        (
            "ابراز المشاريع",
            "ابراز وتوثيق المشروع المكتمل البيانات في الصفحة الرئيسية للمنصة وحسابات الشاب الريادي بوسائل التواصل الاجتماعي",
            2
        ),
        (
            "زيارة المشاريع",
            "زيارات للمشاريع على أرض الواقع للخروج بتوصيات مهمة تساهم في نمو واستدامة المشروع برسوم مخفضة ",
            2
        ),
        (
            "تقييم القيمة السوقية",
            "حساب القيمة السوقية للمشروع بما يمثل القيمة السوقية القابلة للاستثمار عند دخول الجولات والملتقيات الاستثمارية برسوم مخفضة",
            2
        ),
        (
            "شهادة عضوية",
            "منح شهادة عضوية الكترونية معتمدة من برقم تسلسلي موثق للمرجعية Business Pro ",
            2
        ),
        (
            "الرعايات والشراكات",
            "إتاحة الفرصة للتواجد ( راعي او شريك ) في الفعاليات المقامة بهدف التسويق بحسب السياسات والشروط",
            2
        ),
        (
            "المعارض والمؤتمرات",
            "اتاحة المشاركة والتواجد للمشاريع في معارض ريادة الاعمال والمعارض المصاحبة والمؤتمرات والملتقيات حسب السياسات والشروط",
            2
        ),
        (
            "الاستثمار",
            "ترشيح ودخول المشروع للجولات الاستثمارية والملتقى الاستثماري حسب السياسات والشروط",
            2
        ),
        (
            "اللقاءات الإعلامية",
            "فرصة الظهور في لقاء اعلامي تعريفي عن العضو ومشروعه المكتمل بالمنصة عبر وسائل المنصة المعتمدة",
            2
        ),
        (
            "شهادة مشروع",
            "شهادة ترشح مشروع للصناديق الاستثمارية والجهات التمويلية حسب السياسات والشروط المعتمدة",
            2
        ),
        (
            "بروش التميز",
            " منح بروش الشاب الريادي للفائزين بالجائزة السنوية و من يرى مجلس الجائزة منحه تقديراً لجهوده",
            2
        ),
        (
            "الجائزة النقدية",
            "جائزة نقدية سنوية  تمنح لأصحاب المشاريع الفائزة حسب السياسات والشروط",
            2
        );

# events
INSERT INTO
    events (
        `title`,
        `img`,
        `breif`,
        `date`,
        `category_id`,
        `featured`,
        `video`,
        `price`
    )
VALUES
    (
        'توليد الافكار للمشاريع',
        'assets/events/01.jpeg',
        "  <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>",
        '2022-4-09',
        11,
        1,

        "https://www.youtube.com/embed/2MiTWgoazy0",
        150
    ),
    (
        'تحدث الى خبير',
        'assets/events/02.png',
        "  <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>",
        '2021-11-28',
        12,
        1,

        "https://www.youtube.com/embed/2MiTWgoazy0",
        100
    ),
    (
        'تجمع مجتمع الشاب الريادي',
        'assets/events/03.jpeg',
        "  <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>",
        '2021-11-27',
        13,
        1,

        "https://www.youtube.com/embed/2MiTWgoazy0",
        55
    ),
    (
        'شبكة اعمال تنفيذية',
        'assets/events/04.png',
        "  <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>
            <p> لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأسلوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس</p>",
        '2021-11-18',
        14,
        1,

        "https://www.youtube.com/embed/2MiTWgoazy0",
        55
    );

# roles
INSERT INTO
    roles (name, image, price,breif, color)
VALUES
    (
        "عضوية مبادر",
        "assets/memberships/mobader.png",
        230,
        " تساهم في تنمية مهاراتك تجاه العمل الحر",
        "#6a278a"
    ),
    (
        "عضوية طموح",
        "assets/memberships/tamooh.png",
        345,
        " تساهم في استثمار أفكارك الواعدة نحو الحرية المالية",
        "#004f55"
    ),
    (
        "عضوية ريادي",
        "assets/memberships/ryady.png",
        460,
        " تساهم في تكوين علاقات وشراكات لنمو اعمالك",
        "#0026a0"
    );

# users
INSERT INTO
    users (
        name,
        name_ar,
        email,
        img,
        password,
        serial,
        role_id,
        phone,
        breif,
        points,
        featured,
        active
    )
VALUES
    (
        'ahmed mohamed moustafa',
        'عبدالله مساعد باحادق',
        'a.mohamedd@gmail.com',
        'assets/members/male-01.jpg',
        '123456',
        2400100,
        1,
        '05466176681',
        'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا .',
        230,
        FALSE,
        TRUE
    ),
    (
        'nadya el khoshromy',
        'نادية الخشرمي',
        'nadiaa@gmail.com',
        'assets/members/female-01.jpg',
        '123456',
        2200100,
        2,
        '05466176671',
        'يوت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات ',
        345,
        FALSE,
        TRUE
    ),
    (
        'Mashal Ali Albrgs',
        'مشعل علي البرجس',
        'mashasl@gmail.com',
        'assets/members/male-02.jpg',
        '123456',
        2000100,
        3,
        '05466176661',
        'يواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور',
        460,
        FALSE,
        TRUE
       
    ),
     (
        'sahar salem elhotamy',
        'سحر سالم الحطامي',
        'saharr@gmail.com',
        'assets/members/female-02.jpg',
        '123456',
        2000102,
        3,
        '00546617665',
        'يواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور',
        460,
        TRUE,
        TRUE
    ),
     (
        'ahmed mohamed moustafa',
        ' عبدالله أحمد حسان',
        'abdallaha@gmail.com',
        'assets/members/male-03.jpg',
        '123456',   
        2000103,
        3,
        '00546617664',
        'يواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور',
        460,
        TRUE,
        TRUE
    ),
    (
        'Hashm ahmed safy',
        'هاشم احمد الصافي',
        'hashema@gmail.com',
        'assets/members/male-04.jpg',
        '123456',
        2000104,
        3,
        '00546617663',
        'يواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور',
        460,
        TRUE,
        TRUE
    ),
     (
        'ayed ouda alharby',
        'عايد عوده الحربي',
        'ayedd@gmail.com',
        'assets/members/male-05.jpg',
        '123456',
        2000105,
        3,
        '05466617662',
        'يواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور',
        460,
        TRUE,
        TRUE
    ),
     (
        'sara essam zahed',
        'سارة عصام زاهد',
        'saraa@gmail.com',
        'assets/members/female-03.jpg',
        '123456',
        2000106,
        3,
        '05466176611',
        'يواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت نيولا باراياتيور',
        460,
        TRUE,
        TRUE
    )
    ;

# projects
INSERT INTO
    projects (
        user_id,
        category_id,
        city_id,
        title,
        img,
        logo,
        fund,
        status,
        breif,
        imgs,
        location,
        phone,
        file,
        featured,
        email
    )
VALUES
    (
        3,
        6,
        1,
        'تتبع الشحنات عبر الإنترنت',
        'assets/projects/01.jpg',
        'assets/projects/01-logo.jpg',
        3000,
        'قائم',
        "كمن فكرة شركة Flexport المميزة في كونها شركة شحن ووسيط جمركي افتراضي، سمحت هذه الشركة للعملاء بتتبع شحناتهم عبر الإنترنت في الوقت الفعلي، وهو مفهوم جديد تمامًا لهذه الصناعة، يستخدم الآلاف من التجار في أمازون الشركة الناشئة لنقل بضائعهم، مثل: Warby Parker وصانع الأحذية Allbirds وبشكل عام، تقوم الشركة بتتبع عملية نقل حوالي 100.000 حاوية شحن كل عام،",
        "assets/projects/01.jpg,assets/projects/02.jpg,assets/projects/03.jpg",
        'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7245.237072462584!2d46.738586!3d24.774265!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjTCsDQ2JzI3LjQiTiA0NsKwNDQnMTguOSJF!5e0!3m2!1sen!2sus!4v1636582363311!5m2!1sen!2sus',
        '0546617666',
        'assets/projects/pr.pdf',
        TRUE,
        'inadhmi@gmail.com'
    ),
     (
        4,
        6,
        1,
        'التسويق للتطبيقات الذكية',
        'assets/projects/02.jpg',
        'assets/projects/02-logo.jpg',
        7000,
        'متعثر',
        'تقوم شركة Liftoff  على فكرة التسويق لتطبيقات الهواتف الذكية، تقوم برمجيات الشركة على أتمتة إنشاء الإعلانات وشرائها، بهدف الوصول إلى جمهور يهتم فعلا بمنتج علامة تجارية ما، حيث يدفع الزبائن للشركة فقط عندما يقوم المستخدم بإجراء عملية بيع أو تحميل التطبيق، حققت الشركة عام 2017 مداخيل بلغت 123.4 مليون دولار.',
        "assets/projects/01.jpg,assets/projects/02.jpg,assets/projects/03.jpg",
        'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7245.237072462584!2d46.738586!3d24.774265!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjTCsDQ2JzI3LjQiTiA0NsKwNDQnMTguOSJF!5e0!3m2!1sen!2sus!4v1636582363311!5m2!1sen!2sus',
        '0546617666',
        'assets/projects/pr.pdf',
        TRUE,
        'inadhmi@gmail.com'
    ),
     (
        5,
        6,
        1,
        'توفير استهلاك الطاقة من خلال البيوت الذكية',
        'assets/projects/03.jpg',
        'assets/projects/03-logo.jpg',
        3000,
        'متعثر',
        'تقديم الاستشارات الادارية والتسويقية وابتكار منتجات استثمار اجتماعي تستهدف القطاع الغير ربحي والأوقاف لتعزيز استدامته ودعم الرؤية الوطنية 2030 وهو من ضمن مشاريع الاستثمار الاجتماعي يدمج بين نموذجي العمل الاقتصادي والاجتماعي مما يحقق أثرا اقتصاديا واجتماعيا ولدي منتجات ( الخدمات الاستشارية في مجال القطاع الغير ربحي استشاري(وقفي ،غير ربحي) -ادراي -حوكمة ،',
        "assets/projects/01.jpg,assets/projects/02.jpg,assets/projects/03.jpg",
        'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7245.237072462584!2d46.738586!3d24.774265!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjTCsDQ2JzI3LjQiTiA0NsKwNDQnMTguOSJF!5e0!3m2!1sen!2sus!4v1636582363311!5m2!1sen!2sus',
        '0546617666',
        'assets/projects/pr.pdf',
        TRUE,
        'inadhmi@gmail.com'
    ),
    
    (
        6,
        6,
        1,
        'بيع وشراء السيارات المستعملة عبر الإنترنت',
        'assets/projects/04.jpg',
        'assets/projects/04-logo.jpg',
        3000,
        'قائم',
        'تقديم الاستشارات الادارية والتسويقية وابتكار منتجات استثمار اجتماعي تستهدف القطاع الغير ربحي والأوقاف لتعزيز استدامته ودعم الرؤية الوطنية 2030 وهو من ضمن مشاريع الاستثمار الاجتماعي يدمج بين نموذجي العمل الاقتصادي والاجتماعي مما يحقق أثرا اقتصاديا واجتماعيا ولدي منتجات ( الخدمات الاستشارية في مجال القطاع الغير ربحي استشاري(وقفي ،غير ربحي) -ادراي -حوكمة ،',
        NULL,
        'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7245.237072462584!2d46.738586!3d24.774265!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjTCsDQ2JzI3LjQiTiA0NsKwNDQnMTguOSJF!5e0!3m2!1sen!2sus!4v1636582363311!5m2!1sen!2sus',
        '0546617666',
        'assets/projects/pr.pdf',
        TRUE,
        'inadhmi@gmail.com'
    )
    ;

# articles
INSERT INTO
    articles (
        category_id,
        title,
        img,
        content,
        status,
        published_at,
        user_id
    )
VALUES
    (
        1,
        'كيفية إقناع المستثمرين والممولين بفكرة مشروعك',
        'assets/blog/01.jpeg',
        'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواسأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايتنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولباكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.""سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييومدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايتكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيوايفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجنايدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيومايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيدكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنامألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيميلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كومودايكونسيكيواتشر؟',
        'active',
        now(),
        5
    ),
    (
        2,
        'التوازن في عجلة الحياة تجاه ذاتك واهدافك',
        'assets/blog/02.jpeg',
        'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواسأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايتنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولباكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.""سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييومدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايتكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيوايفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجنايدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيومايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيدكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنامألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيميلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كومودايكونسيكيواتشر؟',
        'active',
        now(),
        6
    ),
    (
        3,
        'كيف واجهت شركة جنرال إلكتريك مشكلاتها المالية',
        'assets/blog/03.jpeg',
        'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبورأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريدأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواسأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايتنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولباكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.""سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييومدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايتكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيوايفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجنايدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيومايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيدكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنامألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيميلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كومودايكونسيكيواتشر؟',
        'active',
        now(),
        7
    );
