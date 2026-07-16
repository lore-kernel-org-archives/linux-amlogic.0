Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1394C44512
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dM/tOv837S7zBLlHGgIaRabpjHdhHNlxLaUY7hPXFuA=; b=V0s6r+JKWdXrFE
	dwC8yS9deSJSQCZr8ZntXJYLFiues4u5Jyvf8fU5zKME4nxyOkEiPzG+/rwoJKy4BnCAsgV5g0Kw7
	zuc9kJG51mIQzWcCRTZs/nq4i98fY9dBLFZW4uiEmGdXmKgtqAVMJZM5iDgMJRyrwEIdzulRB7kN1
	Z5e58fqs7SP1W5bmKEJqdw3vF+rxVEyIjCAd36t8LsHWsH9nppaKs8oYWsRnQmrq5uecvO53+UgYc
	U+p0quYU8umqMWk0kLv5qsrHZWe4Zj3euiOpoQmf+EvcwINrLRrrU/NKRlOwf/m4x2Cpdv8/LAc/7
	DpaRk3ZIk0oZMula3xsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNwN-000000002Nz-17Bx;
	Thu, 16 Jul 2026 15:23:59 +0000
Received: from mail-uksouthazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c205::5] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNwK-000000002Mi-272j;
	Thu, 16 Jul 2026 15:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF6vgeCcAwVwak/CZC1G8m18yZtJAY1tZlplX9GRsT3xwY38EZx5iRTOHnuNFKx61nCvJVGffD+kCzjGWZtNUePLn093BX7/TF2jfR2kVwHKb6xL6WzHwofMo3jiJaLqAIUpwj6E9JSmK+Scon1Nj/KcND0pGdDOdBuuqcxwWsG84L/OKFttW5McqIxpveqLoHvISX8/pdw2DTMJVTTB62gtxHAHlj2L9LvUutATEn6iWZUKuelFbMMd/vTeEEXERyTj49MVd9gCyvRW2L0uUA9ueaG6dMh6oqMEpbI0i9NuUJmE7pOMs0l50azelgAaqA+g8sVyoyZ5IfTt4foIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjta1IMoeWuR+Tk3AelrBcb43oQk+2/qwBFW4GV0pK0=;
 b=Tn7t72u36x+trkZBpogVd9pCrsJVs2ilHITwEiWca0gcM2rVY6RGdKTtyuThxGgAIQdCphamu7CMV3XCa22g2UiUfpvfjZ/x0FNy7/raQTFsGoYoqQ95UA5CPXLdn7v6+D7QYfvzEt+ju0d+hq8Sydp5P2rOh0pHHI4QuZxiXPEvBPFAOqHVUWp2NgMPky4s3ZGUxtF6nDrYgr0z5l8GwlaakwSNc10IJ2Q6AM/IG8qIdo7MSlRkYmCrVJzhe4hohGhLHan2q5Lx7Fd/wqGVRVJU3V/mr/+vtlysMxJOPjofkZ7Dd+2C0YqJIk+gQe4W43qcC+RI90of0GzwrzsAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjta1IMoeWuR+Tk3AelrBcb43oQk+2/qwBFW4GV0pK0=;
 b=UI2h/GFfWGjRvYr/peuvAhKLIAnxYZSJLQZ4BuPefWncIZ80lfQgE3d32go6BOzgtATVcmXdOeJK8NFk1fJhr+B8mNzY3ZFFnWjFrpYd6oW3uymZGIspUbeqDZetARXhGfXhjMsswZPW8EXNc7xo7VuMkU9KD1lBSyOExC6ihYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8325.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:466::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 15:23:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:23:47 +0000
Date: Thu, 16 Jul 2026 16:23:46 +0100
Message-Id: <DK03KZBE5E3T.3VQJY9DIBYON7@garyguo.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>, "Srinivas Kandagatla"
 <srini@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Kalyani Akula"
 <kalyani.akula@amd.com>, "Michal Simek" <michal.simek@amd.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Johan Hovold"
 <johan@kernel.org>, "Ronald Claveau" <linux-kernel-dev@aliel.fr>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <imx@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] nvmem: fix a const-unsoundness in reg_write
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
In-Reply-To: <20260716142415.28718-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: LO4P123CA0647.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 1764aef4-e3ca-43ee-5c86-08dee34e3af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|5023799004|56012099006|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: n9p6E+IQ5Ec24YRxYYSTdUZ2t1WbiFfsOeKKBN6ok7WaTx+SaoK4AJZaAkH8gf+qACSFJZQgDPvhtEaGSiloOEfkdnkQlOtgdS5fKtRUn49/FAWfGa94naofpPnhDC7mjfvZKXLBMjYy9zNR5nbO5+RY/CCHRzyYOC8GuN86nRmVAHunE/+KO3/gEIAvcMJ1c2BobPL7Rzp/cEBVvjHGnL4rp5H+xcnkxBSq4qAoQawbwQkOXPxray83/IEinGouxslBP0VYuPqwjMYSRt5BpGcSTi6Shv5ltb21cPyhjvEhGRRAxriu6WAzyJs00jaBGEEJoWXmp4i3SeBk4gzFlFvptNN2ZH+GBrUxQDmh6wEVerjdnnX2etOTCZAhW6cylCn0OhfiTRa9RhP6yG6HlYQXvZyg5WPWcCA2Z0lXWD5GAchykEsDg0YC6HwYogv3iZg48VylJxqtMeCHAZDjEv2heqlM914SfpxhlC3nlYY6l86wOgg4x82q0Q2ovFrgP8IDt7ktTior/NQ9U2Tpy/3gtQ2CxNlAHqc8HrF7O5e3AOTgce7ALe03u3Aw6iBYESazteXiXvNpH9yP+sHqto1rVSdkpwHNovspR6/WxMlhXaofG8PAF0jL04rQ0LPfLaWbe+P4rvTYsHHg/Rm3ne8gvRkbsVCa2oH7T7lfF9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNWbS9PQ2tTVDVLMDBZQXphUEVZRk94anlDMjhjVm4yblJGbnNFK0F0blQy?=
 =?utf-8?B?a0tXQ1VlSzhWTm5DS2tQM3BOWGlPNDVpVTBZVHZXWi9vL1MvMThWWnB1V2dx?=
 =?utf-8?B?NmE3TW84RG93VXpYd1pmQUxtQkE3L09DUXUyT1UwSlk2R3BweVdiQitSTDlS?=
 =?utf-8?B?Q29CQXFURGdKamYya1JpZXRydVZaeUUvV1ZRbjliNlB4d2R1aS9XeDNlUW03?=
 =?utf-8?B?NjBhMjVFcHJEeVZnMU95U0wxQnBZUG9RTks4eHpHYlltdHZzU2dWTlBoNmlX?=
 =?utf-8?B?MlU4WE9abnJLQmlUclJsZ3lvVjFxTHFyU3puTVNYVFFTQThscis5MmZoek9l?=
 =?utf-8?B?blFxVmF1bUd4UGRlUXhrcHJ1cnlUVnRNTmg3QitsQkgzVWRRdHlWT3VlWkdm?=
 =?utf-8?B?QlFDaHFMUmcvR3Y3QVBPVjlhYnQ2Ui9xMWlzaE1pUXdHVmpsTW9BMVdJMDd1?=
 =?utf-8?B?RmJGNnE4b2VYT2EwZzIvc1VSb29QSnc2elE4a3hLaFFKNnRjVWhDUSswdU5V?=
 =?utf-8?B?UVZkd2QwWHB6dS9YempibXdoQ00wNkpUQVZwZmFXa2dYTVJDQzdKdENKNHFj?=
 =?utf-8?B?azlhTHh3dlNjS1lxTkR2b3RMUjczTGE4ZVRCY2lxVFhiNEdaa29tZmc5TkJx?=
 =?utf-8?B?MGZnNTJUWjJFcjRPVTNHNklUUWJ4NSt1WmhsTGRCelREQmJrZmdPUS9URDEr?=
 =?utf-8?B?QVAzS1JVZkNYQXBlMTJjUytXZGh0Q1V2QnlqZUgyRkgyVFFsb3dEdXNyNStl?=
 =?utf-8?B?YU1zRDFaY1JBeUJwNy95L0gyajFWa2tPQ0NzRnRvTUpId1FZMHl4dXdEbXRn?=
 =?utf-8?B?ajBPRURkbGk1ajVDNzRteityV1JYalNjam9mUlc1WnZWdWFoU1EreFdIY3dL?=
 =?utf-8?B?WHdqNmNsUi9WYVVNYXVqR1VuTmRURXFWRGpYdExYL2hqZ0hrOUFJOS91cHZH?=
 =?utf-8?B?aU05Q0FSSnRUT3VZUjRMMnBIL0NCVGRTaFQzaHNGRHF4dnF4QzhYclJJNEZi?=
 =?utf-8?B?VHFWZExWZkZpZEZWODNDcC9WUjk4b3dFYmNNUEwvcjRzTGdJWFJoOWFva2w3?=
 =?utf-8?B?Q1czZkJMR04rSlRHbDI5TU51Q1ZOVCtKb3lKWXNWOGxIL2RCY3hWbGZGUU9s?=
 =?utf-8?B?MGkrUnA4dDN2R1U4MVAxVzVEaXQzMGhyUEEyVUNYTlorYjd0UjZMcSs0MHFp?=
 =?utf-8?B?U21NR2tpbW52TWcvbEo2MHF2Z2xRbTFIS2JBWTZFOWxaUzZwVmxkWXhkdDc5?=
 =?utf-8?B?cXZETDhING1ZY0NNTk1rVU5jdnR3dmFqSDJ3eUViS1d1SmZlQlREWnVRQkdC?=
 =?utf-8?B?SEpDc3NZRkl1OHRWeno0eUN2WlBhWFNRazhjb3JKYnBXUmlodTEvMWFZVGxW?=
 =?utf-8?B?QkpvT1kxbkNjY2FkTG1KSnowVEUwTE44ekpLdlNZWUd0RkRmOHZhZ1ZJbGFR?=
 =?utf-8?B?K09JYmFKU3FVVG5JdnhUaUdKZURuZjI2c0dYUS9xNnhZbzlsSXJXWWMrMjJ2?=
 =?utf-8?B?QUVRblJFTTJLWm9JUmVaSUlXYTUwVG56bFF6QVhqN0lCSHM5UFJ4Zkwxdm5I?=
 =?utf-8?B?VElDS1NZZUgzMzBLcDZ0VDZyc3Q1YzR0WXV1N2tlVXN3REtqTGpxbUhhbWtM?=
 =?utf-8?B?Q3g1Z0dtMlMrQktLVStCb29hMDlWUnhLOXRhTnU5SXJ6T3ZZZWtjeGgrVzVI?=
 =?utf-8?B?SW9yTDd4WUpkSzh1YzNvaFJxTHRmL3BxTno2WG1wU3VBRkpJOGdNV0lrQXB4?=
 =?utf-8?B?ajhpRWFxM2MxSGpXOTN0Nld4aWpoYjZ1ME9FaitIbS8zeE5BR2dvQ3VKQ3hw?=
 =?utf-8?B?dGJhemk1Z0R5Z3pCVk1NMjVIVFpJdCtQMktlZ2lITnlGZURhMWc1eDEyckZN?=
 =?utf-8?B?R1A1U2JTUU1OK0pRa2hQeFNzdTJSekZIc3p4YzRkUks0YXdyQktUelJjTSs3?=
 =?utf-8?B?eFpRaE9YZWlma3Rac2x5L25Ldm1tN2oycVIwbTFkL2gyUzdjWUtoOGdrc2Nm?=
 =?utf-8?B?aStMaE1zK3VLYnUzUU43cFhsd1ZyN1hydXRjazdjY3hMeW5GOW9Db3cvNjlD?=
 =?utf-8?B?TDZWQVlRanZKd1N6a3I4WTRjYlc0cVgwQkZpOW5NSXh5STV2M0Y3c2puV0Mv?=
 =?utf-8?B?ajI5cXZEZ2lSREY3QVBZcW9zUGRnS25NeWNUL0ttZW9SRGZtKzBodS9WN2Zm?=
 =?utf-8?B?TTJQeFlEblJ2TWxJRGZPTFhlREdMS21EV090ejZkdDdlaU9nM2dMaGZSOFdY?=
 =?utf-8?B?Vk9sZFJ1SzE0UHZGN2haZnEwTzdjbVk2SDloS2RDMW81UTVvbVArdmJFMWlH?=
 =?utf-8?B?QXBCeFZWOXArbTB2VytVL2cwN0wrcEFjaDJqTnpDbzFaUnhCeEwyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1764aef4-e3ca-43ee-5c86-08dee34e3af1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:23:47.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 345MzfAWA8p8zb/1ZFejTJFcYJiUP4HsDAYwK3bX3MopVX3NQuFyGBlZf6BdR7sFub/du2/gw1nEgU0mrLqZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_082356_552575_BAF83210 
X-CRM114-Status: GOOD (  19.39  )
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

T24gVGh1IEp1bCAxNiwgMjAyNiBhdCAzOjI0IFBNIEJTVCwgTGluayBNYXV2ZSB3cm90ZToKPiBU
aGlzIGNhbGxiYWNrIHVzZWQgdG8gdGFrZSBhIG11dGFibGUgdm9pZCAqIGZvciBubyByZWFzb24s
IHdoaWNoIGNhdXNlcwo+IHRoZSBjb21waWxlciB0byBiZSB1bmF3YXJlIHRoYXQgdGhlIHZhbCBi
dWZmZXIgc2hvdWxkIG5ldmVyIGJlIG1vZGlmaWVkCj4gYnkgdGhlIGNhbGxiYWNrLgo+Cj4gVGhp
cyB3YXMgZm91bmQgd2hpbGUgZHJhZnRpbmcgdGhlIG52bWVtLXByb3ZpZGVyIFJ1c3QgYWJzdHJh
Y3Rpb24uCj4KPiBUaGFua3MgdG8gdGhlIGd1aWRhbmNlIG9mIEFuZHkgU2hldmNoZW5rbywgdGhp
cyBub3cgaW50cm9kdWNlcyBhIG5ldwo+IGNhbGxiYWNrIGFuZCBkZXByZWNhdGVzIHRoZSBleGlz
dGluZyBvbmUsIHdpdGggdGhlIGdvYWwgb2YgcmVuYW1pbmcgdGhlCj4gbmV3IG9uZSBpbnRvIHRo
ZSBvbGQgb25lIG9uY2Ugbm8gdXNlciByZW1haW5zIGluIHRoZSBrZXJuZWwuCgpJIHdvdWxkbid0
IGNhbGwgdGhlIHNlcmllcyAiY29uc3QtdW5zb3VuZG5lc3MgZml4Ii4gVGhlcmUncyBub3RoaW5n
IHdyb25nIChpbgp0aGUgc2Vuc2Ugb2YgVUIpIGluIHVzaW5nICJ2b2lkICoiIGZvciBjb25zdGFu
dCBkYXRhIGFzIGxvbmcgYXMgaXQgaXMgbm90CmFjdHVhbGx5IG11dGF0ZWQuIFllcywgaXQncyBi
ZXR0ZXIgdG8gdXNlICJjb25zdCB2b2lkICoiLCBidXQganVzdCBjYWxsIGl0CiJtaWdyYXRlIHRv
IGNvbnN0IHZvaWQgKiBpbiByZWdfd3JpdGUiIG9yIHNvbWV0aGluZyBzaW1pbGFyLgoKQmVzdCwK
R2FyeQoKPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBMaW5rIHRvIHYyOgo+ICAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvYWxqQXFCTlZYVjFhVkpxeEBsdW5hL1QvCj4g
LSBSZWJhc2Ugb24gdG9wIG9mIGxpbnV4LW5leHQvbWFzdGVyLgo+IC0gRml4IGxvZ2ljIGVycm9y
IHdoaWNoIG1hZGUgYWxsIGRldmljZXMgcmVhZC1vbmx5Lgo+IC0gUmVtb3ZlIGEgYmxhbmtldCBj
YXN0IG9mIGZ1bmN0aW9uIHBvaW50ZXJzIHRvIHZvaWQgKiBpbgo+ICAgYXBwbGUtc3BtaS1udm1l
bSAocGF0Y2ggMykuCj4gLSBBbHNvIGZpeCBjb25zdG5lc3Mgb2Ygd3JpdGUgYnVmZmVyIGluIGZp
cm13YXJlOiBtZXNvbiwgd2hpY2ggaXMgdXNlZAo+ICAgZXhjbHVzaXZlbHkgYnkgbWVzb24tZWZ1
c2UgKHBhdGNoIDQpLgo+IC0gUmUtcmV2aWV3IGFsbCBjaGFuZ2VzIHRvIG1ha2Ugc3VyZSB0aGUg
cGFzc2VkIHR5cGVzIGFyZSBtb3JlIGNvcnJlY3QKPiAgIHRoYW4gdGhleSB3ZXJlIGJlZm9yZS4K
PiAtIEFjdHVhbGx5IHRlc3Qgd2l0aCBDT01QSUxFX1RFU1QsIHdoaWNoIEkgZm9yZ290IHRvIGVu
YWJsZSBiZWZvcmXigKYKPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBMaW5rIHRvIHYxOgo+ICAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNjA3MTUxNzUyMjkuMjQ2
NzItMS1saW5rbWF1dmVAbGlua21hdXZlLmZyLwo+IC0gUmVtb3ZlZCBhbGwgY2hhbmdlcyB0byBv
dGhlciBzdWJzeXN0ZW1zIHRoYW4gbnZtZW0uCj4gLSBBZGRlZCBhIG5ldyByZWdfd3JpdGVfY29u
c3QgY2FsbGJhY2sgaW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgZXhpc2l0bmcKPiAgIHJlZ193cml0
ZS4KPiAtIERlcHJlY2F0ZWQgdGhlIGV4aXN0aW5nIHJlZ193cml0ZSBjYWxsYmFjaywgaXQgd2ls
bCBnZXQgcmVtb3ZlZCBvbmNlCj4gICBhbGwgdXNlcnMgaW4gdGhlIGtlcm5lbCB3aWxsIGJlIGRv
bmUgbWlncmF0aW5nIHRvIHRoZSBuZXcgb25lLgo+Cj4gTGluayBNYXV2ZSAoNCk6Cj4gICBudm1l
bTogY29yZTogZGVwcmVjYXRlIHJlZ193cml0ZSBjYWxsYmFjayBhbmQgYWRkIHJlZ193cml0ZV9j
b25zdAo+ICAgbnZtZW06IG1ha2UgYWxsIHJlZ193cml0ZSBjYWxsYmFja3MgdGFrZSBjb25zdCB2
b2lkICoKPiAgIG52bWVtOiBhcHBsZS1zcG1pOiBpbXByb3ZlIGNhbGxpbmcgc2FmZXR5IHdpdGgg
d3JhcHBlciBmdW5jdGlvbnMKPiAgIGZpcm13YXJlOiBtZXNvbjogcGFzcyBhIGNvbnN0IGJ1ZmZl
ciB0byBtZXNvbl9zbV9jYWxsX3dyaXRlKCkKPgo+ICBkcml2ZXJzL2Zpcm13YXJlL21lc29uL21l
c29uX3NtLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL252bWVtL2FwcGxlLXNwbWktbnZtZW0u
YyAgICAgICAgfCAxOCArKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMvbnZtZW0vYmNtLW9jb3Rw
LmMgICAgICAgICAgICAgICB8ICA4ICsrKy0tLS0KPiAgZHJpdmVycy9udm1lbS9jb3JlLmMgICAg
ICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICBkcml2ZXJz
L252bWVtL2lteC1vY290cC1zY3UuYyAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9u
dm1lbS9pbXgtb2NvdHAuYyAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbnZt
ZW0vaW50ZXJuYWxzLmggICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9udm1lbS9sYW45
NjYyLW90cGMuYyAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbnZtZW0vbHBjMTh4
eF9lZXByb20uYyAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL252bWVtL21heDc3NzU5
LW52bWVtLmMgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2Uu
YyAgICAgICAgICAgICB8ICA4ICsrKy0tLS0KPiAgZHJpdmVycy9udm1lbS9xY29tLXNwbWktc2Rh
bS5jICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbnZtZW0vcWZwcm9tLmMgICAgICAg
ICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL252bWVtL3JhdmUtc3AtZWVwcm9tLmMg
ICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9udm1lbS9zbnZzX2xwZ3ByLmMgICAgICAg
ICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL252bWVtL3NwcmQtZWZ1c2UuYyAgICAgICAgICAg
ICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmMgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmggICAgIHwgIDQg
KystLQo+ICBkcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMgICAgICAgICAgICAgfCAxMCArKysr
LS0tLS0KPiAgZHJpdmVycy9udm1lbS96eW5xbXBfbnZtZW0uYyAgICAgICAgICAgIHwgIDYgKysr
LS0tCj4gIGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCB8ICAyICstCj4g
IGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCAgICAgICAgICB8ICA2ICsrKysrLQo+ICAy
MiBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspLCA2NCBkZWxldGlvbnMoLSkKPgo+Cj4g
YmFzZS1jb21taXQ6IGI4ODA5OTY5ZTFkN2E1OTFlMGY0OWRkNDY0YTVkMDRiM2NmMDJhYjEKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
