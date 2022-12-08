Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C24C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tGzZRdJf5mXL1HmQ45/8LiptU2+m8+9SOT14nBqGZVw=; b=ZXxXIQFhTufPmY
	JnsHqdBwu6MQcsiJrnEMMQz3b4yECMrirhxttm+r5+XxCnz3P5sZWECupZEICQryIsOFPepXE4z6l
	Z1oFN0cHqjvNdEtrXS70mju2KYoP8eWiXEYpSu9woOcjoez0WPDgIor1MMfxMmyOydgUAEOeOsv+t
	kYjgb2DxIKOcofkr7reDuSWBsNj6FM0YbwCfuKNpdgcVFkOCMWFdktMD0NdZYTeyUzBPhRf286yjJ
	o2e7MXbyCYdz3QIfW8l4SVV40aEYRWxH3g+ZI2EzyKcgOFPI2fbBmqZ7UUC7ISTgGqJj6dRfF1JGN
	byKpxLGn0MZcZ8Ld8O/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3GXa-000Cd0-9V; Thu, 08 Dec 2022 13:02:18 +0000
Received: from mail-os0jpn01olkn20822.outbound.protection.outlook.com ([2a01:111:f403:700c::822] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3GXX-000CMk-UQ
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 13:02:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDxQEdH8BV3mBa56eJX0zvDr+dSki1Y74gcNnMEq7E0scvSgPUJ0E6KQH0u02enWy7QT6N9t21LdoaY2WQOAU+YBTe2die5pQuGzKyzxlrAydIHWDyiqtwBbsdzSBTTBsJCt1ocSBDc58CFxDA7eribXLaawGpX65xO6CVagikpi3nJk/dFxdAbI/6h53up3sTxl72/NyYruLFouS9sc/z7CMRcNup/Kw9Nwc9SEdVRajP4Oz3TfKjpIrsDFmuY2muXbvE+ZprxnePN1icOWWa5/cVZtkCLLUdEeFl6A2IiSL5kIgd1usc52MYwmiX38lmgPM94XlIsCgttiyF3iGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXP1MJglRZ/PnWWXL5VUjKeHPirNszSsdoKYRAuxs2Y=;
 b=UDuXllyx3hOFyeGABdBEBXybsX5cxuvWjCvcqD81y/OddHnyKEMjqi3XcqHZoOG2C7zIC8hwL796Xyf6BD9PktgwkU8cVYtkzxvLzSaRZ9w1W15CJkS+hR9Lrg+zehqIiWB4BlxXId7QRn2a2mBNHlNhi/8ehYz5YlRkh8WcsVPDwSNirhV+RJQ5OeqgcqUvcXfvy+ZAgx6vU2i9IZWYuc/WI45CZGxY9bJXZKy8n/+yNjEMEbHN0sdbRMSOYIbczj3DVK26jceec8wlDcZmZUubLV7RW0CUcVK7FIgnfs9iNPE5lFUY23Yqya76r2+7ooTbf3vskP8+LQgW4oaaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXP1MJglRZ/PnWWXL5VUjKeHPirNszSsdoKYRAuxs2Y=;
 b=q+eRrtpNMYUhSweTxc8YqHeZhudjm5lOWCxOHb3QOjjuerLIZdaMEvZ264Rvhsl8ubcXkU83BlW/sKYSJJrF51IbPjbG6dCK5GG1b+Ep0nfpKBlk1VoCfD4p55v13TwaqEbqYF7+dI6hWEKinwm+7HW/8DuPclGj3SQy8QbItvm1Z2Q4uyNDnkJ2jQpPyQsdcrYoQY7RpJD33SZE3lkvoq3U5lSbU9I+VVitdUWnhi5cB7mM3EroCWa+yzfsO+Ehw2MOhEd9I7LvLVekDvEBLYMEm8NEsjKHyGkm+MRy6ZD54gPzCIkH9Hs/ONiwwShMSfkVELU+sTMzNTpWaCOTBA==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OSZP286MB1608.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 13:02:08 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5880.016; Thu, 8 Dec 2022
 13:02:08 +0000
Date: Thu, 8 Dec 2022 21:02:00 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: linux-amlogic@lists.infradead.org
Subject: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Disposition: inline
X-TMN: [yOw4I7T3VQIT+TcXO4bHr83iEAnmLb716wPELdW5J52r7vFc+XwWLeRzxcGiPmvQ]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y5HgSLSFEf8Vdbqb@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|OSZP286MB1608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b750388-6980-46f3-b873-08dad91c6884
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dwMjh1/YPUaqlDmSbA/sTPuvgiLjBRhJ9yh1X603EIK2e8D8lWe1Et2qQWt8c0ok1KfCSc06yDgk+0OOVQlJqPrJbmQ9evH+rx//ms7TAZ4+YrPd5WdUntwaOe3AXDeqlHqffOh3VdqQ863c9yjohXR4feixl+P8iVs1/tz0d4l4Jqz8cLZV49V03CM2K+ctS3yGFoZW7DNChX9KoEZ4cBzfpw03TEjfhuPg6p2rVfGH5kSrEr9L9tkgzSyOR9eUqdOGR3giHW+GOVyZGi9jnq/5GS9Hl8OCeUCtPiwNvp3E9txrJjaUIGNCsPx0Hc65wOj0WRzhwSu2101nsHNVWCeRO1MqFl6e2e5oH8YIETMr/h5qYON+eFiC8fQMUz9IiQQ0KSxk3KljvmiInEFdqwnnTgJHnm4HRmPSvAhdSV55eiT2UJsQy0Dc8f8gBZtPHzjQTiTqROss+VHtR9aUZ2VDizTzhiNlt4X+ScVJe/5sgV7CvYmPDVROxjktV13lZMLLlzBWNLgA5sffFM3WxPP6GswTTaRCK3s2hM+Ctvv8pnB8PWm/EJy8+ZSxJE+mTcd93Jb7tRqyTV3C41QTXLDLulMIc01R4zXIxCcfMqU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dFBTVHd0TDBLTVBweEdTNzh6M2VHdm81dlFqWjhWcW01dnJDWnVzajYvVWdu?=
 =?utf-8?B?bmdVME5oSnpNdUQwZW5HS2o1WDA3aE51UzBRMDc4Ty9YQmRIaGFYSllzaGxH?=
 =?utf-8?B?K090ZmlnZkV0cHpIMFM0bHJ3anRuRzJ0NGZqcDZXWFl6aXRON25XSFArOE9E?=
 =?utf-8?B?eFlRWmJ3OFlGRVAxUzVaeXFUZFJMallQM2JtbHZsRzhMVnVNRXVoeG5tRHl4?=
 =?utf-8?B?OFdTOU5VV1RkVmU4TE8ySWg2NEtsbi9PaGw0VTQ0emxZcm1aQXI2OU5VOXIz?=
 =?utf-8?B?QW9VanJuU2hxRG44bVVSa0kvUVVRZXBOYUZtbHZ4Y09wbkR2TCtlSHh4NWU2?=
 =?utf-8?B?N2U3QmI1emxhSUFsUWswcjdEcHRmRm16dlJjQXVSODdGVTUxVGh6WnBobHJI?=
 =?utf-8?B?bzVOL3B5K0hLUEVseXR4d3NySTVwOVNXNW5kb0xJM1RZWlVkcElyTXdSVzRi?=
 =?utf-8?B?eDB3azdqRjBMakxLVUx5SU84MGcxdzE1VXJRUFFhMDNsOHlHaFNnUkZjTVQ1?=
 =?utf-8?B?NmtmMWo1K09oRWhuWHNXVnhMcmlwbVFua2FSMXo5cVBXQkNIS3d4bzJxSE5s?=
 =?utf-8?B?NFNHWmlaYnY2QzhHMEU2aHA3eDRGOEJPTE5LR1FjTm0zeHByNFBSc0F6bGZ6?=
 =?utf-8?B?QjJ0bXFBb2tmZHM2WDNaaWt4QVBweEl1cHdPc1Qwd0pINlFMMnFEMTdBL1l1?=
 =?utf-8?B?aDBieDVNakw2aU1yd21QcmhlUzN1clZMci9tWThicDk2Q25BTTVRWmpwVFRT?=
 =?utf-8?B?TjhhWHhkdE9qMFozNTMxTUc3QVdseTIyLy80Q0ZLMTRSUHJWekgyZUVibUo0?=
 =?utf-8?B?dUdxQlIyN0Y3Z0hQdlFjeXpiMjE5d01xNElGdDdpN2lwRFpHTDhSN0kwTFJL?=
 =?utf-8?B?Uk94TEdCYXR4U25YaG5SK3RTMy9JQy9Hd3lORW9PS3NtdVhJTEZhSkNnRERn?=
 =?utf-8?B?aGo1ZHFNY1dMekdOcEE5dWdHZmR4WXdXclJHZ0lmbGhUVkRqSmk4Q01Kbkh0?=
 =?utf-8?B?aHkxQWFaelpkZFQ0b3hLcTBxOGRkWkphTVRJNStjc1VnemQrUXBzL0hIQk82?=
 =?utf-8?B?bEVSdGpPYW0yeUVTYzZNYVVLZXY2SWROZ2pjMXZRNG5qRTU5SEFlaVJxUXZy?=
 =?utf-8?B?bVE4TFl2ckIyOEpYSEF5amRGQnFQYTBwa0VmbUpoZVYzbllTT2c0eENnL1ZR?=
 =?utf-8?B?byt1Q3NpV0gzS205bWp2MTdFT1ZkYVJEYnFpWEpPTi9nK1pMNzB1RGZQV3ZY?=
 =?utf-8?B?bGZqbXlJbHB2QzZpR3U2cm1ZcG50WmhNQXc0YmgrcGFQZkhxVkNPNU5DT3l4?=
 =?utf-8?B?QjA4WWpVZXhjVWlCSDRkSmJxa3lGRnFnWUxGd1pHNjVyQVRucG5LNU5UMTN1?=
 =?utf-8?B?UGh5ZmdlQnJ6N1dHTEoyT1FmY2J5UURhc1BwaHp5OGpOekVncUlscE1vYnc0?=
 =?utf-8?B?OC9yU1Q0VDUrVVExSXNtdVVacVZCOGVQVGgweUNrclQxU3BVUXMzTUpOaHd5?=
 =?utf-8?B?ek9lNlNYV1RFK3Bia1lhc2hVOU1nekUyNExON0o2dUJWY0grNzdyYlhLVFY4?=
 =?utf-8?B?ak1aV2lYeHJFZjFPblhzd2F6ZXZtNWdYb3kyNHFZM1ZlKzVuQjJWdHQyMnhl?=
 =?utf-8?B?TDVxVmJMQVI0T1RudEdjQnlsVlp1ekZ3T3htNTFWTTRUbkxvaVB1V1lmZjBq?=
 =?utf-8?B?OHI0Qjh4c1RMYXNxaGwrUzExNG9wS2pXakhUT3dqallkb1hLcEpzOXZoT2Nu?=
 =?utf-8?B?TitSZkpadmg3ZW5WVDdoa2tlNHBzUUhCWFVaWVRmcW1zd0ZmOWJkTmQzWGUz?=
 =?utf-8?B?RENvTDBPK0p3WjlSeGdtdz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b750388-6980-46f3-b873-08dad91c6884
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 13:02:08.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_050216_036171_2017C75A 
X-CRM114-Status: UNSURE (   1.97  )
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

Hi,

After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
below log:

[  363.591315] INFO: task kworker/0:2:157 blocked for more than 120 seconds.
[  363.598130]       Tainted: G         C         6.1.0-0-arm64 #1 Debian 6.1~rc7-2~exp1
[  363.605870] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  363.613682] task:kworker/0:2     state:D stack:0     pid:157   ppid:2      flags:0x00000008
[  363.621938] Workqueue: events sdio_irq_work
[  363.625989] Call trace:
[  363.628294]  __switch_to+0xe4/0x160
[  363.631812]  __schedule+0x340/0x970
[  363.635300]  schedule+0x58/0xf0
[  363.638351]  __mmc_claim_host+0x104/0x290
[  363.642371]  sdio_irq_work+0x2c/0x90
[  363.645861]  process_one_work+0x1f4/0x460
[  363.649879]  worker_thread+0x188/0x4d0
[  363.653547]  kthread+0xe0/0xe4
[  363.656523]  ret_from_fork+0x10/0x20
[  363.661253] INFO: task ksdioirqd/mmc2:408 blocked for more than 121 seconds.
[  363.668216]       Tainted: G         C         6.1.0-0-arm64 #1 Debian 6.1~rc7-2~exp1
[  363.674977] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  363.682750] task:ksdioirqd/mmc2  state:D stack:0     pid:408   ppid:2      flags:0x00000008
[  363.690961] Call trace:
[  363.693272]  __switch_to+0xe4/0x160
[  363.696715]  __schedule+0x340/0x970
[  363.700154]  schedule+0x58/0xf0
[  363.703285]  __mmc_claim_host+0x104/0x290
[  363.707243]  sdio_irq_thread+0x84/0x204
[  363.711000]  kthread+0xe0/0xe4
[  363.714056]  ret_from_fork+0x10/0x20

I searched linux-wireless and linux-amlogic maillist no similar issue
reported.

I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
to VIM1's kernel 6.1.0-rc7, is it related?

thanks.
Ning.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
