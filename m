Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9860EC76195
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Mar 2023 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXgk8htyVTEwp0aRMWUoMOtwyGYnXQabl83ACVtoxDE=; b=Gcn0FwJRONVw7j
	fd5ARSUQhK8NdSbA2d/IPvBZu5QUl0gW22INEMh3aoX4llo1juTpSHmU6DRyC9c1jy+/pqBT3W2XE
	ZyKgdaINxIJigdz9qpnIe8V2WY1jhYZSGLAvRMv5RZnAVof6jKvOLcHcD1X9FPXitnn2aWUnaKKVz
	3goLgIl09+NqJLwQad/ac9Z+zPR/76lbuerGpiP128GSuUHgFIzUv/9xsR3gkcoVhMQWFqRsXY7an
	uRUJAr/5oHxbtUNSVJvazURE55c/rtaP247ro4d2NrjXk/7yzGZuAYl4DJpcnu5qRr4kNh/nSXKaD
	1/N1c4SSr4VcbILrWcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdXnr-004uML-0h;
	Sat, 18 Mar 2023 14:45:03 +0000
Received: from mail-tyzapc01on20717.outbound.protection.outlook.com ([2a01:111:f403:704b::717] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdXnl-004uKq-37
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Mar 2023 14:45:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifuPvy+aYpsS3YAHApNNcKmPBGLdqTvSBqOpwTBeDT28Zm8neTQrCkkGiKSWL8mBEgT+tWA+RxUpL2epCQjv51hCrQWZeSfWFdMiOdzOSNVQfLd/73Y0XGD+vdVqnjZHrOltNxehXXhVg5FZCYkhdrmKvfrZ7ZCEIKNm1xBTrx6+8Yv4/eX5S6HEHJ0++aG/ZuFY0/I6SXSHr8ePmYg3eNg0YRyq/eqkH0moiF5VUNZy3+xl6jHlqMwMKxhoppoge2oPxnYKwiruWR6b0HLANC3glFd7QhEl5KrstKsW/lDij4VlzwX7ba8HreAZGCtcocSDEByxJGPmvj0Sc7qBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdWPrAePIX5gXg748q3W1bLD+b2XDJQ1Z+lyypoPNDU=;
 b=Bn38jlAEXZZQ7UDSiPAyb1xD7WBu9j4vptdJG2I09POKlE1VSg3sPZX9QDloNK7f/maah0g6iX9//2PA5+E5trVmEYfXSh/dVDEtxDoRynMey9EeYRmmEsuaZu7FkjTiQtcbXtLU1ajexT1W1a8KYcHu72MitzpD8jSJLhUvp1vjxeuYFJnbIcqth4B3Ho8v1KD3xOUBB6z2XmjEs1jKxQFhm+Y319uU4PgUTSB8nGHQ8O7g7aFt9oTF+ZW9TcJ5WaALX4vcG+tAxjn+lFIIHG1k0AsZvkr3/sRK72NShbyZ1UzXGxDYkH1Qp7aChsN8zpLEwDqcLbBH7Jj7gSFkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdWPrAePIX5gXg748q3W1bLD+b2XDJQ1Z+lyypoPNDU=;
 b=beNiwhMd0qF66LrcdqZfpLjRVoeHhA8JAImzegl0Skqv9SaBj9demxauMjHsYjwEThfwmoOvM4ZDrxkvmv9eLKagJVDKnOLWgvv55LtdPa5i/jjn59KdYyeE4/KPXFRoutoaRaTU1r/Q6HVUKhAxSnPZrDBazfnRb6GS88/5e7zC6Wfnj0BRT4M3X0C9tAANT/a1GPDX9ubm/b+QOgUAYsSgqgUDtY8cFU0W1g9yKZyI0gpjFOgCIblwRfJF9aMri9hvYXQJglv1VCul4tXPFv5Cybid29jHkTcDHsKizZpfaswP8R+3OeLYE1jx7D+Yr4VEdRiwOHPfEC900ejusA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5283.apcprd06.prod.outlook.com (2603:1096:400:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Sat, 18 Mar
 2023 14:44:51 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.036; Sat, 18 Mar 2023
 14:44:51 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] thermal/drivers/amlogic: remove redundant msg in amlogic_thermal_probe()
Date: Sat, 18 Mar 2023 22:44:06 +0800
Message-Id: <20230318144412.75046-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230318144412.75046-1-frank.li@vivo.com>
References: <20230318144412.75046-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3cc387-7436-48d2-8d2c-08db27bf54af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KBvBDaoG59gwg3TPaC4IguELAvcixG6Q3mlXU8veS0749SmuuE2p5IQHDxjYLk1fuCiU7+1ZcsP7cW6kOCSx3Im8ZYUV7uB66VRBuSmfAI0khqUcDLG0g9XEk26ViHYY41sSwfahwMujiK4+1VSIPXkRMc8WxFDW1rQIX6wzK6ND8TlR5oEEELtvbLb0y5VVA9CT+U3Rq7Ot2EgcxSWeUXGg0ATcooMK++aET550mNv7DTGHAeLfcov50dqnROkI/Z5YZI1wICy4T2uOyX1tAdg0uXsASJ7Ug0sa5jr4mzm4QsRHN4KEguQ0eCV6oxgIyQECMsTclH6T9xObkRwVWNHGLO9wdEF4o6ToZuHikffUaERJSDn4QRj9zaO2R1nN5JuL04T5eWoT4l1HJdZPi/IP7sPicQN5aD6KzxBIq6szEjhy6pV+2C4FS692s1aQi9FfBBiBVFHfpo/IbV1WnY3GMiKx4fcr3KAFKAN67xnmXje4FPGYpVwN1qt/jTDN2GuFYc0UKTlL5sc5QmPuk8vPyfueJbmP/exa/WMXg3Tlsb1rmbpJuPi/1cIpXioFlNI6w7JqVZCg4UciN//8V9h5NnK/JX7ITxjCuM0PKI4UvkwaNlxmHq+mONkJa6St7jOjDMYCjlKn/HF0MshSpM2ssOAsB9vb8TfPdtvlaGBpyCW92/bzehutZhye4ZradndASrgZqqhHFtEZL2kfAQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199018)(86362001)(36756003)(52116002)(316002)(66946007)(66556008)(66476007)(8676002)(4326008)(83380400001)(478600001)(110136005)(186003)(6512007)(6506007)(1076003)(26005)(2616005)(6486002)(6666004)(38100700002)(38350700002)(8936002)(41300700001)(4744005)(2906002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?41q87Uf1OgnH4ZGgUJWPGmfALqiZVJ7dyEWOopVuAl7VoMb0KCS4prcAm7E7?=
 =?us-ascii?Q?5NWxhQC1jtsrSfjRA3AcxES6Qdl/KEYqoRcPRhE0AXamC2YHcyYWIx7qcg+o?=
 =?us-ascii?Q?YWepm5V8ecLJRoPcSiAqBsbPv25qUmo9cMzZYOjnWGMoGJBNBP9DN8jyzCas?=
 =?us-ascii?Q?paqU7Drx0GM48PihTztainv+6NUidvlzIVykA+uiecJBNJWYDZyMg2j8Fg/P?=
 =?us-ascii?Q?P/SXh+t2KZhxsd/+DFnSTE0EHhkWdyoICiloG1Iz2x5lQvVCN9FmiURHZIEY?=
 =?us-ascii?Q?97dkf26Qmok+jd6nDx5G8GfhIT2tsFMb11KagOlanlsTY4LkwWSpeD/BuJp3?=
 =?us-ascii?Q?l/2Q7UszK1umpty9ij7yrsVDoVfSZjTc1cqRK78IAJ/DuupmZ7XqAZc73LjF?=
 =?us-ascii?Q?a0LzmPf4+baaFxkgdFlTTEN1WQ6OPDyfaMwIg4JChlvWluMuMZrbPuTlw4dy?=
 =?us-ascii?Q?/3UTZdDxDPrYiuwA7m6HRqYQJrfrRgITJtN2shMlj6DJPfsMOK3FRJqGqGJr?=
 =?us-ascii?Q?BI1lsIpXEQUJ9XR8B7sNbMtEzPkluxpjZz+6S30gv8W8YPeWQ03oXVTTdIZK?=
 =?us-ascii?Q?prwEKVIWRJcLpmi666luMjWAsYxGxz+aGDLPWj/9MetcPTy5zrWkNgVzX9uB?=
 =?us-ascii?Q?0JXyZD98RpSn7FISRTZwztH0sx/58yZmQQ+hjKOPkxILdCx6t5KcRvRQuSpD?=
 =?us-ascii?Q?YCTqz0JwrZi3WkR7oZoMhfxvvxLZhALWzGdYH7NnN249wTu8YD4Yib0oEWJX?=
 =?us-ascii?Q?/2x7nrdrD1t4R/ra06OX0mrhsU9bicIr+cYkv0XG7mJLvz4yS4kprFNUGY9f?=
 =?us-ascii?Q?L0usxss8vnOFvfTDBi/zZ6r90iJeG4765pcugeWa1usShLO25Dhh/RC27Yfs?=
 =?us-ascii?Q?ZTa7YTOoxA0ksEbn7GrkejBe3R8qfUXjRqN+JBJEwB5fCHyygiTgP1PGNPwz?=
 =?us-ascii?Q?a0ghXaPV8mW6qJlRyXNb55Eu+v10H0p+f6XTVLMbubuh3WYS7UwUtkqf0tlf?=
 =?us-ascii?Q?OvME6vdwZncMfLcSGQFDvHHSsgQjCjTmf7GhT+saqKxyk1Jx5fEKXBtA8DrT?=
 =?us-ascii?Q?wFCMQU775ps6NNjtb05lX7UbbJ21Zo1aBwBJtyPAhD7ObMZeJxeHlX9yPkjj?=
 =?us-ascii?Q?0e5PoYcB0Mz0TAW6nJNTdXInjkgHS8RvJ60SSUlv5dgEWRgh8mdDRO7+ru+T?=
 =?us-ascii?Q?R5G1vPTYOvvfeHVHM0tX2jHua/mn4ZNTryd19zqeb4UnYCB1O76AkZ1CSYVP?=
 =?us-ascii?Q?XnyNCw5Q5IWuEgt0rmv5drHcEkL9xH63rFHH2lkN4xJu416BvGp898N360bf?=
 =?us-ascii?Q?Ebd4vIbyu+IZeN8vSgWz3fLz3x0tb3zbgqMKr5dN4oeVWnyCaRJmnarAqMvg?=
 =?us-ascii?Q?Ty6vGJQKgaTLSulu3KRGn+ct6j5XBLNfBfz9GjoBUwmy0rY4baMAXEQNtC59?=
 =?us-ascii?Q?gUkFNuR2cJ5462QmMJUhMobKgcJtQd0ydowtoCIty7bFbB1ImUA1mNQYbMUa?=
 =?us-ascii?Q?J2SwHOcKTqlgUAuaz+66PW4HkLS1KVbBlv0Di3UwMAwC3d76EqnRaPJ9yFys?=
 =?us-ascii?Q?ohdGfE+d3fvEvrznRFo+E9+1La7EyXuIi2RyvuSi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3cc387-7436-48d2-8d2c-08db27bf54af
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 14:44:51.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGwzv5zdIaYoUE0mqu44GHRrew92KUABnaCIXiGACOGU9zUu/jr5IHsfp8z0PgsfWdnHNQ4gQk4ZgKSL+XvWsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_074458_009278_3E1B5C09 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The upper-layer devm_thermal_add_hwmon_sysfs() function can directly
print error information.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/thermal/amlogic_thermal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 4bf36386462f..16e52e26a5d7 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -285,8 +285,7 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd))
-		dev_warn(&pdev->dev, "Failed to add hwmon sysfs attributes\n");
+	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
 
 	ret = amlogic_thermal_initialize(pdata);
 	if (ret)
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
