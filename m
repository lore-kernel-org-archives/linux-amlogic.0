Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3187AC44508
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtIw+yE5R99QuEbItj8vGUmB6a4EqCG3mRCzq5Cpe+M=; b=p02972GY8G2ABp
	T9WQBCwWed0hp48l7TGgJkJJ9unkCmJrRTUIoV/s0hPKYpE0VmlSha88oS9nZ7LgbLgI5ef17GWA/
	4RWvlIRgtVtZ1tzJX7PLh9Obs/WLV3lCOci5pDt9kjQm7ob+heVkhHM5vAlkzF8Ooof0EoGMolDBn
	r5MjSaL6R7ccuhPRz2Mgc4ypKP9wlVxRb2EPN1OgnwD1p7bAmq1Wq7c5izJYkGYjSOab5GB1D+QT8
	+lPMDzxP9MLx/kifxEF6H4eR5JdF+j3uoxyelU3i29yOH5Hl/G1JXvuYnN/muiNN5wH5qOiHc3QzK
	oqCRufC03ve6vVcLX+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5vN-0000000FrGm-0x34;
	Wed, 15 Jul 2026 20:09:45 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5vJ-0000000FrFm-4A5j;
	Wed, 15 Jul 2026 20:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NG0gxBMHS0wvRtT86cxTIGL/6aS0hCLIDtyuD87FZMyF/QhyAcVYl9yC9FG5OKalTY/oUbh8iN8wVBjdnU76Dp3jAlSSEitc3pM6Tq/I5SPbhZI5vlCI/gqEOjWdkOcsc3rtFyD/Nks9l6H5rpxiwfJMV2wukHrF+cbwd3YBtpIJR6cVXQuHEOvRBqWgDxui/J6SA+n9boCANM6jKgP0PcLtkeYpY1flrcLcCgOgL0NY8RQOyThvONSJFTh59sneO7UXxFiGotR9DByrlrJILzJQrVnu3b4yX4Xu8O5fCJswggXrTMGUkzHyJI87GG3432P3surPgEeLPAZOzvyBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz7XmmX24Tx0vj9ovwY/pe6OU0HN8uVAdrXrOF9QOJs=;
 b=RO0x3/Y0my8HG/iHtN61dPy+67+ak+jqLFj7iAMBSew4bRyCG50gYcQ9F+72vke6o7zSo+9bA9eAM1JfPSJi5DFMmlZZYkjTKny7IxhkMgUDHNUeLwTgnk17hQxbXHi2G7dVcoYaixxe8CmTG14O0kcoVgMNrwYCOvyUmp+0pM38PDDJdqcw0ZAC2b5C4MEI/WzXLTI2/sRp1AArui9mVVbziNlcCU6ms/wrLsK6V4sWvxQ+1YWI0jQTG2fNHP74M0k9VPsVK7yjJgunXwZeXgx7CMSZWGuAM9vlIXK9y5z5EHCG19dzDb6RZrIBOfAPZXxChjek2LBwm0dQMW53DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz7XmmX24Tx0vj9ovwY/pe6OU0HN8uVAdrXrOF9QOJs=;
 b=pSfmfcC/lkXddvqri1BMdaKFH3xNC+xcGCbBrYVopO9ofw32N+d3HQ+DLeYkCmUlNCGkrtb6TzLVcCtSsiQDSwLVZvineJ1NazAbEJxNxbQa9qMXy7f+HOKAOaJdQtKe+4CjekdtayKQFTvSSkshq6CfUQdM9aw2guAi9tZDX6miOZgerY3AJapoJ9mL4cpEdxucuPSnWfXNoalOk481wUMkVsSaN+k5qAJSN+IuzbeQDFFuouUUG9bz8B7k8U/fshOaFRi8oNzCbu/OPOdx8hDnkr7hNHn5x9hSePxMGTsCRUIx/tHohomgKPp4Y1r41rFEfiphFFbE/pygYKoJPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS0PR12MB8342.namprd12.prod.outlook.com (2603:10b6:8:f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 20:09:23 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 20:09:22 +0000
Date: Wed, 15 Jul 2026 16:09:20 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joshua Kinard <linux@kumba.dev>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Salah Triki <salah.triki@gmail.com>,
	David Carlier <devnexen@gmail.com>,
	Achim Gratz <Achim.Gratz@stromeko.de>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Patrick Wicki <patrick.wicki@siemens.com>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Markus Perkins <markus@notsyncing.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org, mfd@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] nvmem: make reg_write() take a const void *
Message-ID: <alfo8Mobje173POp@yury>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <alfZNQGcX0Z68eto@ashevche-desk.local>
Content-Disposition: inline
In-Reply-To: <alfZNQGcX0Z68eto@ashevche-desk.local>
X-ClientProxiedBy: BN9P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::28) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS0PR12MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 739916a5-6cc9-45f8-75a5-08dee2acf5ec
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: kjktUjFr3YHIAd9HOXDnj8X0kzTKzPsKlrEb74pmZzz1oKd0R5473G9G4H9nXkfurcWsAVRNiIn+MGejIXnY2O1Q9TwJteO87bui/ox5Wpc+e4jyVpTYN80+KiaUHDL+RENozmOJq9z7theAUXthgs4WaAmQcX4ZKMLpAiCwK2d8WQm6X7T7i7YqKR6rLAsBZIQNQoSZE6byz6rxvyQTn1Y9L1y6JKG+OYOuPbfkDaZE+/x5bnk/CPtcCDfDzlG99snvWoUn3nLkZCQq/jnAlqwcJcoxJfworBmDUkScxPe3kyFfst7OOgIkhQbBanycl2jHlLF+kyTL+iFXrQo7JxQSqyOuPSgoJ0WqHOXU3en3jV0gUayueLnV/fPKopOoeTZ3hGOxYUXTwZGIhGHP3He8s2cRXhV+aU7EwiSucaeD9hgBouNZaeMsLRoX2LXGXcH2e6hqyzJ8cMIJJeqqUXcVYvsAsX+QaVhSDsB820rmUDkOUjW3B+mteywq3BauR5IGy0rZ7neI8JQzc6p0iK8uiJLUfwzV+cpWuqz/lma0b5UmCP6isVuH6/s6NCOvsgmtHPE9CaD+G6qlj6LGDj4pOVOShWklvd8ysc6OYnsbiCWpsQvKSf37uBO0NHdDZdlgeiMCAbj+CFFH6B61aRc7N4xbCnC+Ue2lgYi2sbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnZndmVmamFCaFMyMEY0MzRWNElKY2VqWStWT2U0R09kRGl5Uy9qZ3RpUFZ0?=
 =?utf-8?B?dm1VZlBCd3ZpRTdLN3BIeEMwNURsanZzNjZhNDVmNjdLUkp6eFJpTWJyeGd0?=
 =?utf-8?B?V2lLRTFjR2h4bnpsdE9QOXRuekhJYnZ4djlORjdhQTQwRllvblRoNTJoNlJN?=
 =?utf-8?B?a1JsMHJXYmhTVHNhdFhhVjZtclVGRmNyMmwxRFpVZGJDRzJhLy9QVS91OG9q?=
 =?utf-8?B?c0ZQVkRSYnFxVEFsaHM5aGpWR1d4QzZCZUJNeHY1a2tsLzZrb0RJU0UwU2hD?=
 =?utf-8?B?c1crQWp0Yk1nemx4SjVoeVZKZjRMU2szWGFqNTBJRm4xV0t6eXZCZHg0NzB3?=
 =?utf-8?B?YlVOcDlNajJIaXBTQUVRZWJFb2F6cFd4YXVWOHM5NnBpZ2hvQ0Y4U1BvU2wy?=
 =?utf-8?B?T2d4VVY5S2g4b2dJaXpTNzU4R1VLdjJSMUFjMU41VElLbk55WmZjc2kxVlRm?=
 =?utf-8?B?Rk1JNTFtWHRqZFpQeWZXbGdjNGVNSWtaS3lLVmpWaFc4L0x0ZmNQMEJvV0ho?=
 =?utf-8?B?OEhpSTcrL2hJdXIza3ZSSXpYRVJIR3lJZDVzVEZsN29mdnF2ZTl5UzhFcjJK?=
 =?utf-8?B?M0RMbzE4U0p0R0RrUHVzVVh3Q3pjTlppaGFyMFZHamhIVkhyRElDdE1xb1Fk?=
 =?utf-8?B?NnpLZmR6VG9hV0cyYmE5bHU5ejI5cGtHZEZOK1ptb2hzSUtJNTk0UFNPZUhV?=
 =?utf-8?B?U1BFSGovSGdjaW8wMEdhTEQ0ZHNCcjhJNkYzTHlLdXgzMmlvLzcrbmJLZHdL?=
 =?utf-8?B?Y1Q0QVZ2d0lFY0pSMkpoWVR1dGtKZlFjMGRheTlBMU42U2N1bXlmN1oweU83?=
 =?utf-8?B?ZmRhd0pzWjlCV2R0d1VYaS8vUSs1UklPdFFGb2JtcktTcy9KVkpHbFpkV0FO?=
 =?utf-8?B?aithWkwrbmMybGdtTXk4am9yUmRwZGRMN21hQmduakdTSTcwblJnYXJyOG52?=
 =?utf-8?B?T3hvdGkrVXk3bWJyWThPMXVVS3I5V0pwSjlMcStKNWpUL1JmQXRlaVhHSTR3?=
 =?utf-8?B?MDVWVEorYXhmVzlaMDR5b1JOczJoMmFaai90aDExbHFxY0ttVEVObERZMm1Z?=
 =?utf-8?B?RzI2UC9kVkwzL2FFdHhaanpWMFNZSWFGOUtLLzY5R01pNStnM0hoRm5mL2hG?=
 =?utf-8?B?ZmtBQ2M3RUZ4L1B3NGtzOUxpT25TWCtoQTVUN2tKL05zMnJ1cWpNVGpyYUJq?=
 =?utf-8?B?elFpaGJ5SlFselpwRHhUQ2RZNitFY3l1cjVpZ1N0UEFZSEwvOWQrUE9qbGhB?=
 =?utf-8?B?R3FhQ3dqenJRSk92QlZGQUVJSEJRMkdMenc0djduOE5lNlQ5aVNpR3FpWlp6?=
 =?utf-8?B?L3hoOThQRithbFB1UVVGQk5SUzg4M0dmb0ZHZXl6TkhqRVVDcjVET3hRazVJ?=
 =?utf-8?B?c0J6dGNPQStYdlljRWZhNTVySWN5SnBMU1YyZUF6MjRRQ2Y3SWR1RXNIR1NP?=
 =?utf-8?B?eDhkcEJ5MVQweE5kcUl5MnkvNFpTejF6Q1lGb3BKYzNwTy94dDBPSEovSlVX?=
 =?utf-8?B?ZDFoRFhXbXdkRDZ6WjZpVnZtblcreEUxOTdtZmNGays2bEVoOTVUazI5VSt5?=
 =?utf-8?B?U2QyU1dLbER2WjJIK2VIeC92WWFuWWRBR1YyZHJSWDg4eVYzSUU4dVpsNUVm?=
 =?utf-8?B?Q0Uva1ozbDRsTWVQM043bWhXVEh0SWo4UjZUbG85ekIyNGJYWmlndXdZZ3hT?=
 =?utf-8?B?UFVMRklCdVhGZGtsMllQMEdiR2ZzVURndmF6azB0Uy9zL3FxRUJIT2JNekI4?=
 =?utf-8?B?QXFjMk1Xem4rZC9FWUhMcFNDUWEwVXFRNEUxMjMvRGJQTk9HaStiOTJ6VlFB?=
 =?utf-8?B?N0xWTzR1QkFNaWtFUlhKVHJSMDgzWUt4dHR3MFFnVFlBUDVxQXcxY1ZiZHgr?=
 =?utf-8?B?N0x5ZWxtM3hnVEx0LzRuZDVZdnVVU3BOYWhLSHYvK1RIRWJuek8za1RwRUVF?=
 =?utf-8?B?NE5GQi96aGRqY055ZDd0dVZIKzROL2g3YUFRNllMUWljVWhHUVU2Q1hEamR3?=
 =?utf-8?B?UnZOaTBiRVFXZkIzUWtGL284U0hVcFI5MCtUNVlENDl0SmZlcDBzM1M0WUVt?=
 =?utf-8?B?eklTamZMOWk2ZktXY0VSMENZM0VuRDM2VytjTTYzU1MzcjYwK1NGR2RkZ3JM?=
 =?utf-8?B?a2NNd011cUpxUFc4VW1xK2Nxc1V4cnd6Q1pwLzJVTmI3UTMzYzdmcCtmOEZo?=
 =?utf-8?B?WEJDVmh3VllNNVZ3czNtRzM3UkhlQjhtS29jYWpXVEJQZkt0Tmh1YmtSRi9r?=
 =?utf-8?B?eWFiTXVsK2hwYVVmMXB3NXUvajNZd0NEdzl5L0xBbE1uL0RRbzBGOE9pZmQy?=
 =?utf-8?B?djRoY3hpL2dBWjNwNFVQbmlHYzE1aFg3RGJsOGtvNEp4eUI5YmFRQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739916a5-6cc9-45f8-75a5-08dee2acf5ec
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:09:22.3545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imKJ2ftKfyu26Ucy9tRvrhtrWr4sGKGFzteveH/jcXLL1Ms1j6mHohHKVtbD2KiFZdyqz5HKF+ud7u1xeIA1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_130942_499873_3ABD6657 
X-CRM114-Status: GOOD (  22.68  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgMTA6MDI6MTNQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDE1LCAyMDI2IGF0IDA3OjUyOjE2UE0gKzAyMDAsIExpbmsg
TWF1dmUgd3JvdGU6Cj4gPiBUaGlzIGNhbGxiYWNrIHVzZWQgdG8gdGFrZSBhIG11dGFibGUgdm9p
ZCAqIGZvciBubyByZWFzb24sIHdoaWNoIGNhdXNlcwo+ID4gdGhlIGNvbXBpbGVyIHRvIGJlIHVu
YXdhcmUgdGhhdCB0aGUgdmFsIGJ1ZmZlciBzaG91bGQgbmV2ZXIgYmUgbW9kaWZpZWQKPiA+IGJ5
IHRoZSBjYWxsYmFjay4KPiA+IAo+ID4gVGhpcyB3YXMgZm91bmQgd2hpbGUgZHJhZnRpbmcgdGhl
IG52bWVtLXByb3ZpZGVyIFJ1c3QgYWJzdHJhY3Rpb24uCj4gPiAKPiA+IEnigJl2ZSBzcGxpdCB0
aGlzIHNlcmllcyBiYXNlZCBvbiB0aGUgc3Vic3lzdGVtIGVhY2ggcGF0Y2ggYWZmZWN0cywgYnV0
IEkKPiA+IHRoaW5rIGl0IHNob3VsZCBnbyB0aHJvdWdoIHRoZSBudm1lbSB0cmVlIGluIG9uZSBn
byBhZnRlciBnYXRoZXJpbmcgdGhlCj4gPiBhY2tzIGZyb20gdGhlIG90aGVyIHN1YnN5c3RlbSBt
YWludGFpbmVycy4KPiAKPiBJdCdzIGFuIG9wdGlvbi4gVGhlIG90aGVyIG9wdGlvbiAoYW5kIG9m
dGVuIHdlIGdvIHRoaXMgd2F5KSBpcyB0byBpbnRyb2R1Y2UKPiBhIG5ldyBuYW1lLCBjb252ZXJ0
IHVzZXJzLCBjb252ZXJ0IHRoZSBuYW1lIGJhY2suCj4gCj4gU2VlLCBmb3IgZXhhbXBsZSwgaG93
IEdQSU8gc3Vic3lzdGVtIGNoYW5nZWQgYSBwcm90byBvZiAuc2V0KCkgY2FsbGJhY2suCgpJIGFn
cmVlIHdpdGggQW5keS4gVGhpcyBzaG91bGQgYmUgYSB3ZWxsLW5hcnJvd2VkIGJpc2VjdGFibGUg
c2VyaWVzLApzbyBwbGVhc2UgZm9sbG93IGhpcyBzdWdnZXN0aW9uIHdpdGggcmVuYW1pbmcuCgo+
ID4gSeKAmXZlIGJlZW4gdG9sZCBwcmV2aW91c2x5IHRvIG5vdCBpbmNsdWRlIHRvbyBtYW55IG1h
aW50YWluZXJzIGluIENjLCBidXQKPiA+IEkgZG9u4oCZdCBrbm93IHdoaWNoIG9uZXMgdG8gcmVt
b3ZlIGZyb20gdGhlIGdldF9tYWludGFpbmVycy5wbCBvdXRwdXQsIHNvCj4gPiBJ4oCZdmUgc3Rp
bGwgaW5jbHVkZWQgZXZlcnlvbmUsIHNvcnJ5IGFib3V0IHRoYXQuCj4gCj4gV2l0aCB0aGlzLCBy
YXRoZXIgc3RhbmRhcmQsIHdheSB5b3Ugd2lsbCBmdWxmaWxsIHRoZSBhYm92ZSByZXF1aXJlbWVu
dAo+IGF1dG9tYXRpY2FsbHkuIEFsc28geW91IHdvbid0IG5lZWQgdHJlZXdpZGUgY2hhbmdlIHRv
IGJvdGhlciBldmVyeWJvZHkKPiB3aXRoIHRoaXMuIEFuZCBhbHNvIGluY3JlYXNlIHRoZSBjaGFu
Y2VzIHRvIGdvIGluIChtYXliZSBpbiBhIGZldyByZWxlYXNlcwo+IHNwYW4pLgoKSWYgSSBmZWVs
IHRoZSByZWNlcGllbnQgbGlzdCBpcyB0b28gbG9uZywgSSBoYXZlIGEgY291cGxlIGhvbWUtYnJl
d2VkIHNjcmlwdHMKZm9yIGl0OgoKICAkIGNhdCBhZGRfbWFpbnRhaW5lcnMuc2gKICAjIS9iaW4v
YmFzaAogIAogIGxpbmU9YHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLW4gLWYgLS1zZXBhcmF0
b3IgLCAtLW5vLXJvbGVzdGF0cyAkMWAKICAKICBzZWQgLWkgIi9eU3ViamVjdDovaSBUbzogJGxp
bmUiICQxCiAgc2VkIC1pICJzLz4sLz4sXG5cdC9nIiAkMQoKYW5kCgogICQgY2F0IGFkZG0uc2gK
ICAjIS9iaW4vYmFzaAoKICBmb3IgZiBpbiAwMCo7IGRvCiAgCWVjaG8gJGYKICAJLi9hZGRfbWFp
bnRhaW5lcnMuc2ggJGYKICBkb25lCgpTbywgbXkgYXBwcm9hY2ggaXM6CgoxLiBSdW4gdGhlIC4v
YWRkbS5zaAoyLiBQaWNrIG1haW50YWluZXJzIGZyb20gZWFjaCBwYXRjaCwgYW5kIHB1dCB0aGVt
IGluIHRoZSBjb3ZlciBsZXR0ZXIuCjMuIFRyaW0gY292ZXIgbGV0dGVyIFRvIGxpc3QsIGlmIG5l
ZWRlZC4KClRoZSBkaXNhZHZhbnRhZ2Ugb2YgdGhpcyBhcHByb2FjaCBpcyB0aGF0IHBlb3BsZSBt
YXkgcmVjZWl2ZSBhIHBhcnQgb2YKdGhlIHNlcmllcywgc28gZm9yIGV4YW1wbGUgY2FuJ3QgYXBw
bHkgaXQgY2xlYW5seSBmb3IgdGVzdGluZy4gQnV0IG5vdwp0aGF0IGV2ZXJ5b25lIGhhcyBiNCwg
ZmV0Y2hpbmcgZXZlcnl0aGluZyBpcyBhcyBzaW1wbGUgYXMKICAgICAgICAKICAgICAgICBiNCBt
Ym94IDxtZXNzYWdlLWlkPgoKVGhhbmtzLApZdXJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
