Return-Path: <SRS0=2SAA=5E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DCAC4332E
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 11:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F632071C
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 11:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5H/3kpx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="E0mc/8xa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F632071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8TAO6Na2HMdoFVJ7BHlB9NiclwSLXKdbu6XILsBH0c=; b=g5H/3kpxyXBKg/
	6TX3YbBhztwjA6HedkjlSaux85dQUMTPKGNRf/EVnUw2VzzEf2P26PTSBZL1sJm/AjfZtWBn9s0S9
	79/RDMJxkbpsos3neOlYN0ZKORSBDfxW2+55Wqiv9/zLnuzs8txatW5Xp/KHfSc8cvp7lrziylHHt
	4+mwz0BZwj2Q/xZ+3AaYnZC+IYTRzgQTCZT1Q80+slnsgfCjCc08KAXXMC1UfCDveLGfMZc8TwS7V
	eioURKMvlaa4ZMOPR1ql/+ucqCPlyKvN7aASwOeqR52PLpJXiKjbEgJXvUPD2uay62u204++IBNZx
	8JCo1zyPNowmajFTfusg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtdV-0004qd-9u; Thu, 19 Mar 2020 11:46:53 +0000
Received: from mail-eopbgr140092.outbound.protection.outlook.com
 ([40.107.14.92] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtdR-0004pG-MB; Thu, 19 Mar 2020 11:46:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGNgbY9Ta49flkaM2nIjgTt+NYq9wLh41R5lAD9EyRj46jaCMvge+TE5MVNVpZdq4kwfQEL+3R9J2XhlKVvznxhXshMar9hld7kRpPgnYZQehkWr84VCrs2MkkUWuFN7XjFAuF8Yb3EAmv6tcT1AuxkeeftHg5fl7MVfvvDCzwTBhlgRFmT/mcZuXrIfKGmSwN0WJSDgHOrGge0GZfk5sXOs3uq1w1ngPWcuouott2Nd8li7NkcxZkFOaWN8mjoWbJdOKMP1MSeMMpEyBpqRgiU69FQk/aSjtFzZPrE3QKt99altXM5AFX67CELH47ohplqUP06CEm8U55moIvnBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1JMdCzgSmxnlUslDXemgsBTKCWxeoCXEBHNe8q40zU=;
 b=cXvUH43rBxWxJsyA3MT7D8Mo9qr2P0Mfy+spXSRY4npnGF8dQKPVF4O5FWGUpbsdYQlmzYhlksMv6SCDWbZb4bOZ6VlAR+KCM92CyOkbsp7M7Udcg3k/zGgbQ+dLSp9mrvSRvuXaEOoj046N5hCNNV4OGcA8A6Qn3MUclYivs6qez6y7YY4KgOVV22IgZPVlDD4p7EeKqaA0ES+szSl6LTeVcB29Kl0kDhsAkUxgi/0jo7ML/1laLl4oitwctfM6CToXE8uPuw3oYrzPtIKxYYqZoQx8WvEPhhUbiv0Dlr5XgejhA3rmc3ECUhgbK2hcwDE4jpy1+9y8WWRoVsJ2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1JMdCzgSmxnlUslDXemgsBTKCWxeoCXEBHNe8q40zU=;
 b=E0mc/8xaX/FcUVsqgbRpopylcTiIiw5Ht59oE3jGK0P4PXh/Ll4Fow+Ty0SpQuTWt4BnPuHaJemesI5Ajr/kEx9chxqziPZlNL06SdaBuTau7iEkHvEuDTBZhQ1CY9+QaKqaV/CXW16wyuUWE9hqwkuGo3+a/lBTjdzgdH9twbM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1SPR01MB0382.eurprd05.prod.outlook.com (20.178.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Thu, 19 Mar 2020 11:46:39 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2814.021; Thu, 19 Mar 2020
 11:46:39 +0000
X-Gm-Message-State: ANhLgQ3zHyD2OEhn5bggFA+fhjHDRVA0j4ZoK4Tcod3kQARymcFuqXjY
 7tmliO94qjVl2cLhxuG40iHIBp+/mgDcG/lKi/I=
X-Google-Smtp-Source: ADFU+vtIv9WWiUZDY1zK2/5Xskt2zIX9VTS8I1COHPgUfpZpdDX7VDSalNnvt8sXvRj9YOkAdKw03F1mQyy6mpu0nPY=
X-Received: by 2002:ad4:54d4:: with SMTP id j20mr2405410qvx.75.1584618039943; 
 Thu, 19 Mar 2020 04:40:39 -0700 (PDT)
References: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
 <20200317123231.2843297-2-oleksandr.suvorov@toradex.com>
 <20200317174043.GA1464607@ulmo>
 <20200317210042.ryrof3amr7fxp4w5@pengutronix.de>
 <20200318225953.GA2874972@ulmo>
In-Reply-To: <20200318225953.GA2874972@ulmo>
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Date: Thu, 19 Mar 2020 13:40:28 +0200
X-Gmail-Original-Message-ID: <CAGgjyvGd4y8M0L1sFMvQ1=gPcKfUPoR13dVS7F5WZx=333KG6g@mail.gmail.com>
Message-ID: <CAGgjyvGd4y8M0L1sFMvQ1=gPcKfUPoR13dVS7F5WZx=333KG6g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] pwm: rename the PWM_POLARITY_INVERSED enum
To: Thierry Reding <thierry.reding@gmail.com>
X-ClientProxiedBy: CO2PR18CA0049.namprd18.prod.outlook.com
 (2603:10b6:104:2::17) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-pl1-f172.google.com (209.85.214.172) by
 CO2PR18CA0049.namprd18.prod.outlook.com (2603:10b6:104:2::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21 via Frontend Transport; Thu, 19 Mar 2020 11:46:39 +0000
Received: by mail-pl1-f172.google.com with SMTP id w3so958793plz.5;
 Thu, 19 Mar 2020 04:46:39 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3zHyD2OEhn5bggFA+fhjHDRVA0j4ZoK4Tcod3kQARymcFuqXjY
 7tmliO94qjVl2cLhxuG40iHIBp+/mgDcG/lKi/I=
X-Google-Smtp-Source: ADFU+vtIv9WWiUZDY1zK2/5Xskt2zIX9VTS8I1COHPgUfpZpdDX7VDSalNnvt8sXvRj9YOkAdKw03F1mQyy6mpu0nPY=
X-Received: by 2002:ad4:54d4:: with SMTP id j20mr2405410qvx.75.1584618039943; 
 Thu, 19 Mar 2020 04:40:39 -0700 (PDT)
X-Gmail-Original-Message-ID: <CAGgjyvGd4y8M0L1sFMvQ1=gPcKfUPoR13dVS7F5WZx=333KG6g@mail.gmail.com>
X-Originating-IP: [209.85.214.172]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16fd174-65b5-4826-5ae1-08d7cbfb2fc0
X-MS-TrafficTypeDiagnostic: VI1SPR01MB0382:
X-Microsoft-Antispam-PRVS: <VI1SPR01MB038234994FADDC08B7AD49A2F9F40@VI1SPR01MB0382.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(199004)(6666004)(54906003)(8936002)(2906002)(8676002)(81156014)(66476007)(81166006)(186003)(66574012)(26005)(66556008)(66946007)(44832011)(5660300002)(53546011)(316002)(52116002)(42186006)(966005)(86362001)(9686003)(4326008)(6862004)(55446002)(450100002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1SPR01MB0382;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+5HjOxkcKlK8Pva+vyKzWztLAS7pPo8prOnvsDVPAN4Q7faD001APCFslDIeOYAejp/QBbgFl3g+Prk3An+tBMmPm4rBMRAW9b235lLz2/laXeXJRbwRNaJ0Pc2TuHFiXzqtcY+2+N6h+r4Wf2uGoCtfbr8cYTcP9T/bXTo4aiqg3LlQiElkK8sg87GVaAntMIHM1xOFgvTbZAP5FdfFufSK8r4Ol3gtysIoDh7btXE6l0p0saZttTSyr1Gv4JvWTdxOCSbHtXTos6W5FwnO8OxMVgvDPNkUMFJrrNU/Y4/2RRPa/F/upywSl+8lH0VlUCux1LRGBitUfvy0j2NtG0QLuB+ub0m/pSFWAARJ/RtCaPTgzO5N+Ukk4b6dS0SDQFY9V5/CW5HtbffJir9R7MacvLrM83dEAnx8ZzqdpVePZbODSBOiZep5Hoq7HXr3KDWK9wb1U65y86I/AINWe8kMHAzPUJddDdStW0KX67e2bYtV6JpilrpctueCkpWckfDFfsqCg554QA/WdJuew==
X-MS-Exchange-AntiSpam-MessageData: N2HouI0fIBc+1Twp0n8yH6R1iNUb3i0JQHqHjusZ9YpCiIVKRepfL7BtU5j4YufIk0OcEZ2T7WdZkZWO7AjzscfvF+mUxGXEXMggY2lMTrmr1ce42Do008JYxogmkKadeVvXk8DdZM8EAm92jJ9AHw==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16fd174-65b5-4826-5ae1-08d7cbfb2fc0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 11:46:39.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2DKc/uetUm16sIWJazQlH/+p9UdLAxSgCIOH8e93ShF++wlc0OqmzZqA0iRyU9UMvPjUBJOULa6J9uv1ZvrjLlUvKSRH5HIRNkYwmDuLzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR01MB0382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_044649_730071_77CAE38C 
X-CRM114-Status: GOOD (  28.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Paul Barker <pbarker@konsulko.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Scott Branden <sbranden@broadcom.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMTowMCBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDEwOjAw
OjQyUE0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gSGVsbG8sCj4gPgo+ID4g
T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMDY6NDA6NDNQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDAyOjMyOjI1UE0gKzAyMDAsIE9s
ZWtzYW5kciBTdXZvcm92IHdyb3RlOgo+ID4gPiA+IFRoZSBwb2xhcml0eSBlbnVtIGRlZmluaXRp
b24gUFdNX1BPTEFSSVRZX0lOVkVSU0VEIGlzIG1pc3NwZWxsZWQuCj4gPiA+ID4gUmVuYW1lIGl0
IHRvIFBXTV9QT0xBUklUWV9JTlZFUlRFRC4KPiA+ID4KPiA+ID4gSXQgaXNuJ3QgbWlzc3BlbGxl
ZC4gImludmVyc2VkIiBpcyBhIHN5bm9ueW0gZm9yICJpbnZlcnRlZCIuIEJvdGgKPiA+ID4gc3Bl
bGxpbmdzIGFyZSBjb3JyZWN0Lgo+ID4KPiA+IFNvbWUgdGltZSBhZ28gSSBzdHVtYmxlZCBhYm91
dCAiaW52ZXJzZWQiLCB0b28uIE15IHNwZWxsIGNoZWNrZXIgZG9lc24ndAo+ID4ga25vdyBpdCBh
bmQgSSBjaGVja2VkIHNvbWUgZGljdGlvbmFyaWVzIGFuZCBub25lIG9mIHRoZW0ga25ldyB0aGF0
IHdvcmQ6Cj4gPgo+ID4gaHR0cHM6Ly93d3cubGV4aWNvLmNvbS9zZWFyY2g/dXRmOD0lRTIlOUMl
OTMmZmlsdGVyPWRpY3Rpb25hcnkmZGljdGlvbmFyeT1lbiZxdWVyeT1pbnZlcnNlZAo+ID4gaHR0
cHM6Ly9kZS5wb25zLmNvbS8lQzMlQkNiZXJzZXR6dW5nL2VuZ2xpc2NoLWRldXRzY2gvaW52ZXJz
ZWQKPiA+IGh0dHBzOi8vZGljdGlvbmFyeS5jYW1icmlkZ2Uub3JnL3NwZWxsY2hlY2svZW5nbGlz
aC1nZXJtYW4vP3E9aW52ZXJzZWQKPiA+Cj4gPiBodHRwczovL2VuLndpa3Rpb25hcnkub3JnL3dp
a2kvaW52ZXJzZSNWZXJiIG1lbnRpb25zICJpbnZlcnNlIiBhcyBhIHZlcmIKPiA+IGhhdmluZyAi
aW52ZXJzZWQiIGFzIHBhc3QgcGFydGljaXBsZS4KPgo+IEhlcmUgYXJlIHRoZSBmaXJzdCB0aHJl
ZSByZXN1bHRzIGZyb20gYSBHb29nbGUgcXVlcnk6Cj4KPiAgICAgICAgIGh0dHBzOi8vd3d3Lnlv
dXJkaWN0aW9uYXJ5LmNvbS9pbnZlcnNlZAo+ICAgICAgICAgaHR0cHM6Ly93d3cuZGljdGlvbmFy
eS5jb20vYnJvd3NlL2ludmVyc2VkCj4gICAgICAgICBodHRwczovL2VuLndpa3Rpb25hcnkub3Jn
L3dpa2kvaW52ZXJzZWQKPgo+ID4gSGF2aW5nIHNhaWQgdGhpcyBJIHRoaW5rIChpbmRlcGVuZGVu
dCBvZiB0aGUgcXVlc3Rpb24gaWYgImludmVyc2VkIgo+ID4gZXhpc3RzKSB1c2luZyB0d28gc2lt
aWxhciB0ZXJtcyBmb3IgdGhlIHNhbWUgdGhpbmcganVzdCByZXN1bHRzIGluCj4gPiBjb25mdXNp
b24uIEkgaGl0IHRoYXQgaW4gdGhlIHBhc3QgYWxyZWFkeSBhbmQgSSBsaWtlIGl0IGJlaW5nIGFk
ZHJlc3NlZC4KPgo+IEkgZG9uJ3Qga25vdy4gSXQncyBwcmV0dHkgY29tbW9uIHRvIHVzZSBkaWZm
ZXJlbnQgd29yZHMgZm9yIHRoZSBzYW1lCj4gdGhpbmcuIFRoZXkncmUgY2FsbGVkIHN5bm9ueW1z
Lgo+Cj4gPiA+IEFuZCBhcyB5b3Ugbm90ZWQgaW4gdGhlIGNvdmVyIGxldHRlciwgdGhlcmUncyBh
IGNvbmZsaWN0IGJldHdlZW4gdGhlCj4gPiA+IG1hY3JvIGRlZmluZWQgaW4gZHQtYmluZGluZ3Mv
cHdtL3B3bS50eHQuIElmIHRoZXkgZW5kIHVwIGJlaW5nIGluY2x1ZGVkCj4gPiA+IGluIHRoZSB3
cm9uZyBvcmRlciB5b3UnbGwgZ2V0IGEgY29tcGlsZSBlcnJvci4KPiA+Cj4gPiBUaGVyZSBhcmUg
YWxzbyBvdGhlciBzeW1ib2xzIHRoYXQgZXhpc3QgdHdpY2UgKEdQSU9fQUNUSVZFX0hJR0ggd2Fz
IHRoZQo+ID4gZmlyc3QgdG8gY29tZSB0byBteSBtaW5kKS4gSSdtIG5vdCBhd2FyZSBvZiBhbnkg
cHJvYmxlbXMgcmVsYXRlZCB0bwo+ID4gdGhlc2UuIFdoYXQgYW0gSSBtaXNzaW5nPwo+Cj4gVGhl
cmUncyBjdXJyZW50bHkgbm8gcHJvYmxlbSwgb2J2aW91c2x5LiBCdXQgaWYgZm9yIHNvbWUgcmVh
c29uIHRoZQo+IGluY2x1ZGUgZmlsZXMgZW5kIHVwIGJlaW5nIGluY2x1ZGVkIGluIGEgZGlmZmVy
ZW50IG9yZGVyIChpLmUuIHRoZQo+IGR0LWJpbmRpbmdzIGhlYWRlciBpcyBpbmNsdWRlZCBiZWZv
cmUgbGludXgvcHdtLmgpIHRoZW4gdGhlIG1hY3JvIHdpbGwKPiBiZSBldmFsdWF0ZWQgYW5kIHJl
c3VsdCBpbiBzb21ldGhpbmcgbGlrZToKPgo+ICAgICAgICAgZW51bSBwd21fcG9sYXJpdHkgewo+
ICAgICAgICAgICAgICAgICBQV01fUE9MQVJJVFlfTk9STUFMLAo+ICAgICAgICAgICAgICAgICAx
LAo+ICAgICAgICAgfTsKPgo+IGFuZCB0aGF0J3Mgbm90IHZhbGlkIEMsIHNvIHdpbGwgY2F1c2Ug
YSBidWlsZCBlcnJvci4KPgo+ID4gPiBUaGUgZW51bSB3YXMgbmFtZWQgdGhpcyB3YXkgb24gcHVy
cG9zZSB0byBtYWtlIGl0IHNlcGFyYXRlIGZyb20gdGhlCj4gPiA+IGRlZmluaXRpb24gZm9yIHRo
ZSBEVCBiaW5kaW5ncy4KPiA+Cj4gPiBUaGVuIHBsZWFzZSBsZXQncyBtYWtlIGl0IGRpZmZlcmVu
dCBieSBwaWNraW5nIGEgZGlmZmVyZW50IHByZWZpeCBvcgo+ID4gc29tZXRoaW5nIGxpa2UgdGhh
dC4KPgo+IEFnYWluLCBzZWVtcyB0byBtZSBsaWtlIHVubmVjZXNzYXJ5IGNodXJuLiBGZWVsIGZy
ZWUgdG8gcHJvcG9zZQo+IHNvbWV0aGluZywgYnV0IEkgcmVjYWxsIGJlaW5nIGluIHRoZSBzYW1l
IHBvc2l0aW9uIGF0IHRoZSB0aW1lIGFuZCB0aGlzCj4gd2FzIHRoZSBiZXN0IEkgY291bGQgY29t
ZSB1cCB3aXRoLgo+Cj4gPiA+IE5vdGUgdGhhdCBEVCBiaW5kaW5ncyBhcmUgYW4gQUJJIGFuZCBj
YW4KPiA+ID4gbmV2ZXIgY2hhbmdlLCB3aGVyZWFzIHRoZSBlbnVtIHB3bV9wb2xhcml0eSBpcyBw
YXJ0IG9mIGEgTGludXggaW50ZXJuYWwKPiA+ID4gQVBJIGFuZCBkb2Vzbid0IGhhdmUgdGhlIHNh
bWUgcmVzdHJpY3Rpb25zIGFzIGFuIEFCSS4KPiA+Cj4gPiBJIHRob3VnaHQgb25seSBiaW5hcnkg
ZGV2aWNlIHRyZWVzIChkdGIpIGFyZSBzdXBwb3NlZCB0byBiZSBBQkkuCj4KPiBZZXMsIHRoZSBE
VEIgaXMgdGhlIEFCSS4gZHQtYmluZGluZ3MvcHdtL3B3bS5oIGlzIHVzZWQgdG8gZ2VuZXJhdGUg
RFRCcywKPiB3aGljaCBiYXNpY2FsbHkgbWFrZXMgaXQgQUJJIGFzIHdlbGwuIFllcywgdGhlIHN5
bWJvbCBuYW1lIG1heSBub3QgYmUKPiBwYXJ0IG9mIHRoZSBBQkksIGJ1dCBjaGFuZ2luZyB0aGUg
c3ltYm9sIGJlY29tZXMgdmVyeSBpbmNvbnZlbmllbnQKPiBiZWNhdXNlIGV2ZXJ5b25lIHRoYXQg
ZGVwZW5kcyBvbiBpdCB3b3VsZCBoYXZlIHRvIGNoYW5nZS4gV2h5IGJvdGhlcj8KPgo+IE15IHBv
aW50IGlzIHRoYXQgZW51bSBwd21fcG9sYXJpdHkgaXMgYW4gQVBJIGluIHRoZSBrZXJuZWwgYW5k
IGhlbmNlIGl0cwo+IGVhc3kgdG8gY2hhbmdlIG9yIGV4dGVuZC4gQnV0IHNpbmNlIHRoYXQgaXMg
bm90IHRoZSBzYW1lIGZvciB0aGUgRFRCLCB3ZQo+IG5lZWQgdG8gYmUgY2FyZWZ1bCB3aGF0IGZy
b20gdGhlIGludGVybmFsIGtlcm5lbCBBUEkgbGVha3MgaW50byB0aGUgRFRCLgo+IFRoYXQncyB3
aHkgdGhleSBhcmUgZGlmZmVyZW50IHN5bWJvbHMsIHNvIHRoYXQgaXQgaXMgY2xlYXIgdGhhdCB3
aGF0J3MKPiBpbiBkdC1iaW5kaW5ncy9wd20vcHdtLmggaXMgdGhlIEFCSS4KClRoaWVycnksIEkg
c2VlIHRoZSBQV00gY29yZSBjb252ZXJ0cyB0aGUgYml0IGZpZWxkICJ0aGlyZCBjZWxsIiBpbnRv
CnRoZSBwb2xhcml0eSB2YXJpYWJsZS4KTm93IEkgcHJvYmFibHkgdW5kZXJzdGFuZCB5b3VyIHNp
Z2h0IGFuZCBhZ3JlZSB0aGF0IHdlIHNob3VsZG4ndCBnaXZlCnRoZSBzYW1lIG5hbWVzIHRvIGJp
dHMgaW4gYml0ZmllbGQgKGR0cykgYW5kIHZhbHVlcyBvZiBhIHZhcmlhYmxlLgoKQnV0IHRoZXJl
IGFyZSBsb3RzIG9mIHVzZWxlc3MgIjAiIHZhbHVlcyBvZiB0aGlyZCBjZWxsIG9mICJwd21zIgpv
cHRpb24gaW4gZHRzIGZpbGVzLgoKSSBzZWUgMiB3YXlzIG5vdzoKLSBqdXN0IHJlbW92ZSBhbGwg
IjAiICJ0aGlyZCBjZWxsIiBmcm9tICJwd21zIiBvcHRpb25zIGluIGR0cyBmaWxlcy4gSQpzZWUg
dGhpcyAiMCIgY29uZnVzZXMgc29tZSBwZW9wbGUuCi0gY29udmVydCBwd21fc3RhdGUucG9sYXJp
dHkgaW50byBwd21fc3RhdGUuZmxhZ3MgYW5kIHVzZSBiaXRmaWVsZApkaXJlY3RseSBmcm9tIGR0
Yi4KICBJdCBzaW1wbGlmaWVzIHRoZSBwYXJzaW5nIGxvZ2ljIGFuZCBtYWtlcyBhZGRpbmcgbmV3
IGZsYWdzIGVhc2llci4KCldoYXQgZG8gdGhpbms/Cgo+Cj4gVGhpZXJyeQoKLS0gCkJlc3QgcmVn
YXJkcwpPbGVrc2FuZHIgU3V2b3JvdgoKVG9yYWRleCBBRwpFYmVuYXVzdHJhc3NlIDEwIHwgNjA0
OCBIb3J3IHwgU3dpdHplcmxhbmQgfCBUOiArNDEgNDEgNTAwIDQ4IDAwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
