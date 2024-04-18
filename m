Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDD5C4345F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2024 01:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GTwaJaATETJxq2ovMwiiPqUc5OrR1BgBKqHUEjmjXA=; b=w9yVDqWAMmznAx
	Xj4za/jRhEK9aVxCYwH2ILfgLD1MBgG75TVr7QeOH2x7dCfw/H/OdIB551eS7LYtNffSMlZVAhyWr
	meIhJWlOnlHmiCdRMddtINr+tBj3N8lw9sc03Z3Mls2Bv3g6ne+9DpWF756+oKX+w9zEtv0B1yMO3
	POGKw+MoGJc5j3p9UZh3rdhgrYm0Poq0A4qbjg3fgjHHWceD8JmZDubFKNWCx42hndMV7k6k2SIlE
	a62nXlghY523nQJTkWVslK7MUIKjwWqmakEhEev6wH30KfeRVYsxq5eVFFxRD0h0eOJ50I11iKF/E
	8K43d49X/bERfPN8kE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxGMg-00000000XFG-49CV;
	Thu, 18 Apr 2024 01:15:02 +0000
Received: from mail-sgaapc01on20715.outbound.protection.outlook.com ([2a01:111:f400:feab::715] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxGMc-00000000XCR-0ufY
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Apr 2024 01:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAC9G/koEB6R6wHvqbZy9Sbm/Pl1QjjA1HH2daSzrZs4hzBTEC9CXbqWFwD6urS2cB6guPflaQu1nWiWc/gAVx7LOOanB7fbaTEr++5GqI7oM71kYdDUctHTngvpr3aAEXO1RHW+7DNNFSt/6AY8UGl8JU/gHZO5mwRXoNsvBwuF9bPiU9ve30d9E8agc2O6xoMnctty1ZlJneQaozDesmnappBv2hvFkxHb3qJ+Iph+FM1PTZ5YSugJj78mwQ/Dm228yrZf34dFKLGF31q/9kFJpfVIExD1qsLx6hN8iB6MkMd+DB04XgYgm/FuvVU6cSmKor0uJWvgDMK/t/oVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asLXWLRNORne4baWr09ANw5ghKQRF/gk+kJlS66R/C0=;
 b=GhPVtoL6Ax6OpM3FUjge4bhzXBHrW4Fm3vBdXE2AjjWkq0eWfY9TYSN/gOJLWS7pZUPDVoP64KkRY2M5ygLWGQHh/WGAUzZmSISaH/DEvcuchxhaDl/vCd49lFKwUV7ImNVs1/tdho+ucqBRhcxuFI73+qfoMnrJ9afMSXPrey8COeaX4W9voyEFf5DeBfrI+i9DGrEniIq3rUQJPDdxwUtVzIF+bYajtpiwkDDEzhicU3jRz53xYvCb/xnlLGxleKbltiv18EFB7TV+uxbUwcfO0IJesp9s6nUGs6u4Blf1cB0dFM4MngbDJmF/glvPSviA9f2RDPgCbf3HNOa91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com (2603:1096:400:26a::14)
 by SEZPR03MB7899.apcprd03.prod.outlook.com (2603:1096:101:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 01:14:41 +0000
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::c4f9:d4f1:c115:f1ca]) by TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::c4f9:d4f1:c115:f1ca%6]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 01:14:41 +0000
From: Jacobe Zang <jacobe.zang@wesion.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: Nick Xie <nick@khadas.com>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "quic_jesszhan@quicinc.com"
	<quic_jesszhan@quicinc.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] drm/panel: add Khadas TS050 V2 panel support
Thread-Topic: [PATCH v2 0/2] drm/panel: add Khadas TS050 V2 panel support
Thread-Index: AQHajuM9/ZN6rFP9zE+scjfEkOJR6LFo+KyAgARBulg=
Date: Thu, 18 Apr 2024 01:14:41 +0000
Message-ID: <TYZPR03MB700133DB7CF443D0393EC867800E2@TYZPR03MB7001.apcprd03.prod.outlook.com>
References: <20240415031408.8150-1-jacobe.zang@wesion.com>
 <9df035d3-438a-46d7-8fba-183aea84023a@linaro.org>
In-Reply-To: <9df035d3-438a-46d7-8fba-183aea84023a@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7001:EE_|SEZPR03MB7899:EE_
x-ms-office365-filtering-correlation-id: b0f05bd5-5d5f-48b9-eab1-08dc5f44ece0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jkd3hU4t0Ebl486ITTR8g27qo/RrP5WWnG+yihmCct6Fei7lWJJ+su72D7?=
 =?iso-8859-1?Q?iOQX2gti3QFTe0Ef1E+JQhHjdoZ/28sw1F5EhmMOeOngkf66yEd/F6X7gW?=
 =?iso-8859-1?Q?Pqu2y0S4QOCOxH4j/eY9dG+fj+YtQ6QU7pK5oVpdDjZPo4LsJ29I8vrH/k?=
 =?iso-8859-1?Q?zAiy8r/6Lrhn35j603gQUSg2tud8fFCMw23YjwC5p9ZZdI+Y3UMhUH1TgU?=
 =?iso-8859-1?Q?+XK2PH0zlzyMjqs0oFOIxjf4UgrvD+BJ704yW4WTf0T+mRhmSMqBMQT8NE?=
 =?iso-8859-1?Q?7+p4okLt85Y4ghSrYkmERgoR/KaFR0QdkNjecDw6KhTXEmKRld09LlYe3r?=
 =?iso-8859-1?Q?EpMqv3IL1dmeABKe+jqX1vHwTlj7aADSipj1JEXN22nDj7HtnDm1yh04GJ?=
 =?iso-8859-1?Q?U91Ps3jGe/QDI2/YqM7QWoTIFPbsVcPQ/ey4h4dk0SuU2m3T41+0En3Voj?=
 =?iso-8859-1?Q?tbAZ9lTMyzNJoyDU34psiFDtbdrqTFJln6pol51c9+eUn5yBME4xxFLSqu?=
 =?iso-8859-1?Q?yKZB1JkMuOzhIX7JlycQrTrj4KRy5+A4BXO/+u264RZB/8KJPyMMsTDo9G?=
 =?iso-8859-1?Q?NnvmFyYpa/1UomWHtvxLq29zBqQKWTukm/C3TMjOUkRVFO8FYvMJ4uWxzD?=
 =?iso-8859-1?Q?885m/X4nZEfkOVpihlFrS/YwdSEiths9JF6ESyCvJ3n8y/MPU6mkkSEFqz?=
 =?iso-8859-1?Q?mPkBVG705MUPmGVPw1dilvTvm9TeVRk6v6FV8/Sqx8JNldUc2257256v7+?=
 =?iso-8859-1?Q?FbxSi8A5VPw1NvssskcSoOjSF5qz4yih+OlG+oQcdMduglJUGP8TTmxhVs?=
 =?iso-8859-1?Q?pm/1FEIs6uaKoljSo6vpJPy8FXJ5Q7LOqo13ITKC4yPdPqCSpC/g5GU7IY?=
 =?iso-8859-1?Q?3L771bFJKL/wE8pnuFo9VUbuWl70CRNqbhs8X9vEVqFazhJFZYSjclXBPH?=
 =?iso-8859-1?Q?WJkOxj1Ugx7DXKlLAN85I0VflVAleGNpTzSShj/8AVyPRwVLbnxqfxTlj/?=
 =?iso-8859-1?Q?fst+jHXtkI+AyNCz5EWBXdT1lG+V1C8w8RkaJx07zqTdmod82RB8aOfCtF?=
 =?iso-8859-1?Q?VVkN/YpIEkqjYg9wHWkD7bPCPPEnEQfUG3aJX0YqHXd08gkXfqUL4+jc+c?=
 =?iso-8859-1?Q?P7jkly3ddqmpmTDR4JmXKiCclCwUhPabXSwXBM8jDE/OKjgbFsMfo/35kH?=
 =?iso-8859-1?Q?em9nCTc89w2idk2LLABBqiPS0AHNcrdOgonSnHCvgvTFkNclUiU61Vg/1w?=
 =?iso-8859-1?Q?onrIANW58Lzvv0ZMESTZB7kUXXZOEER7zbaNK0wGBvGi4spf3UOuns5Dz/?=
 =?iso-8859-1?Q?v+Cm51y578psZk/c2glJE+rEKQvNoPSXWZZ6IsufVvjgZ4GKOir5qbqkex?=
 =?iso-8859-1?Q?9OS3coQwW8AWlbY9vy5Quf3ZNgthMgfDkDMx382BKizmg3783PH74=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7001.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(1800799015)(376005)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oHAsNe7AQvio8+zkw+RoqhBtNitoQ0E60pTiJABCp79TolDILu4F0sV3QW?=
 =?iso-8859-1?Q?5CcbWtXJwVs6/3Znqme6uxRwlUCEeBCEXR6DvxLP81Nz/fgGnu7xQxCfFy?=
 =?iso-8859-1?Q?NvJ+dcN+rl39VLpi17xAUNHkM1RpBDbBKb8poQGo8DBX1T3sS0SB1i7atd?=
 =?iso-8859-1?Q?qAB07QTDi+7SHmCOobsg4AQAGphdRrLBm4CG+nMAFvbWEDKos/hLhQhs4w?=
 =?iso-8859-1?Q?/uVlsXsPh+D/Yq0WMVuJmH1a1W/F9WlrNqndlUhVjBSJvsjDTTgC8AUllS?=
 =?iso-8859-1?Q?V2LNj6z5YYjCH5MvhvEtFUKPQSUZ01MzXTf7pDQ+idaesgcqtdjacvf8h0?=
 =?iso-8859-1?Q?/PtMhxj4QhIFbkKHhzLxwT/ADAVc+BBy76wc16GoeYQ9ckchoHXs6+b7sD?=
 =?iso-8859-1?Q?6PfIhh3UVFrLsw0VFIpPLnysUrts4hifYReZ+HQ5w9vnqqVagRI9hFhvxJ?=
 =?iso-8859-1?Q?iF9uE91U+49CrT6axkTYIxbPvJr8kxL0tfNQh57i7E4Q22zPkraNBLQI6w?=
 =?iso-8859-1?Q?kfJ5QUZ+rQn8FcCEdlWLQyrFKuBL9uFo7uegG/82D7weV4IBzjC5lISj5j?=
 =?iso-8859-1?Q?hRiH5aLLAClKly8NMhSp2YYPziBM5uZsGYu81dJvdT9RdalFokBtWEMNOH?=
 =?iso-8859-1?Q?po1c8VJfkaByBHMTjzQ2IrEtYzrNI/qzs6sDOl2ik8dNN7c/1/AbB9GTKM?=
 =?iso-8859-1?Q?I3rG8YeADqy7OQB8NmFG1Ah1J5to7FotM5mfVKslXQ9m0+n05nrwf2fTtb?=
 =?iso-8859-1?Q?bRNzoM8SqZGhmzlfHOvsjqtwSvhdVQRjVK56jYcQqWQKMpUd5L/a+zunv/?=
 =?iso-8859-1?Q?GdX15fIcMxwJS0lwDxUlULy31z23sKofUueJsvbhdS03nxtmgvbnvREO+Y?=
 =?iso-8859-1?Q?sik2vW+ojXhPamUgTAeI0EOsqXdv/4COgcV0qqmsrXOUVN0G9CJwD7B8wZ?=
 =?iso-8859-1?Q?JFFrPoRQXhxc+gjUZkxS27lz+KaYTsithVH/fL46xnNZzXlhhqzLl8c/V4?=
 =?iso-8859-1?Q?Ah/OTOF1q2vYPTpnKeycA+gtQrs/msVLCBY36YgCTMCJnnSMf0OH/E+/fj?=
 =?iso-8859-1?Q?x/j5imRuk4MgKGqFvyNCXvEP/y/PgZxW/AmloglFO6A9Ykr2brunhnDC95?=
 =?iso-8859-1?Q?xiM1WJswbwYI4U3uIbHNY0IdkdiHj+nmahxwNfwrbB5tIXizQLK6C5A47R?=
 =?iso-8859-1?Q?w20ZKtF1kXS57D1G4knuTuFZLQF2nAwrClQQ7oxmy3gRd50NQur0vqjwYm?=
 =?iso-8859-1?Q?gPxqOfop+YORhVNhEGI70NwBfwcCqLY0GH/Y60BheMq1rvdbY8J+dLF+9N?=
 =?iso-8859-1?Q?4Ad7em285I/wNEGY9BJjEQlyPJmgn89V9wszLkoCaSnaWyDY487/pr1d1o?=
 =?iso-8859-1?Q?DCqhKAj3BYRcxycfn4sF/RZeyEdZanphaKn9q8uQL0Z++wLhlDBWkoyTPd?=
 =?iso-8859-1?Q?ryhWtoUXBtXvi9RRBHCZfG/omJpmuLQgNAvLUe8VKDNAI9Prb6j19QHUx/?=
 =?iso-8859-1?Q?jSD1r2+HVx507nLVij3DUAfFJw4yCeYMK11p/JQrBHgFrB4zTMrpgEqGr2?=
 =?iso-8859-1?Q?4jrtI5qJgFSVzNd7sv6c6puzG1MJ0qwCZX29LtiMMd20F30FUyuRXHtjmE?=
 =?iso-8859-1?Q?QGCTtWtrZrQWNQxQukIFDeY8GrwUT3eeCN?=
MIME-Version: 1.0
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7001.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f05bd5-5d5f-48b9-eab1-08dc5f44ece0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 01:14:41.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWM4cjTaUc4xXyFSk9i1IVdVPAt7B5XZXvSZ3VVNhkTvpQVWGxzmzxPXhPXPhWp9T7w0RNC0yCP0dagnAz0xjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_181458_287169_F5649858 
X-CRM114-Status: UNSURE (   6.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

> You must say that you ignored/dropped received tags.

I don't know which tags you mean and where should I fix. Please tell me in =
detail.

Best Regards
Jacobe



From:=A0Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Sent:=A0Monday, April 15, 2024 16:02
To:=A0Jacobe Zang <jacobe.zang@wesion.com>; neil.armstrong@linaro.org <neil=
.armstrong@linaro.org>; airlied@gmail.com <airlied@gmail.com>; daniel@ffwll=
.ch <daniel@ffwll.ch>; maarten.lankhorst@linux.intel.com <maarten.lankhorst=
@linux.intel.com>; mripard@kernel.org <mripard@kernel.org>; tzimmermann@sus=
e.de <tzimmermann@suse.de>; robh@kernel.org <robh@kernel.org>; krzysztof.ko=
zlowski+dt@linaro.org <krzysztof.kozlowski+dt@linaro.org>; conor+dt@kernel.=
org <conor+dt@kernel.org>
Cc:=A0Nick Xie <nick@khadas.com>; linux-amlogic@lists.infradead.org <linux-=
amlogic@lists.infradead.org>; quic_jesszhan@quicinc.com <quic_jesszhan@quic=
inc.com>; sam@ravnborg.org <sam@ravnborg.org>; thierry.reding@gmail.com <th=
ierry.reding@gmail.com>; dri-devel@lists.freedesktop.org <dri-devel@lists.f=
reedesktop.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; l=
inux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Subject:=A0Re: [PATCH v2 0/2] drm/panel: add Khadas TS050 V2 panel support
=A0
On 15/04/2024 05:14, Jacobe Zang wrote:
> Changes from v1 at [1]:
> - Fix name from "newts050" to "ts050v2"
> - Add specific description about controller change

You must say that you ignored/dropped received tags.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
