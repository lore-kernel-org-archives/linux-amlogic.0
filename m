Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E54CC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSfK0Fb5CDi9JzU6iJptgFFnLP5mSwcp+3YLDutdV8I=; b=ygykrMv9BlQzjH
	CsmOO2xsJh+NW73xnbl0gCt90SY2SxTwTi2heh5GtyRtSzhjLse+mEZhdTfPKEtgrCZHY61SunEWo
	KRkdtjzWXzlhTrviPgCE8xrkA2AMYSUjlwuDfnyAfZ5OZRaVNi+TM2UZrfWQrseTQJDMjZe0Nj88E
	edG/RaA8/Yq8G1FzkwRsYf9Ohvi/Tx317Ac0/6KYEvgmD+bHYGlnKzQzIiQbigftpJZObNFTmf7Tk
	Tzc0qt7ARv9ZtKXcPyNh6oOk4JYlP97VIgbW6mFgl5nOrpN38ZwdM686DNIxmvCnBTbYmedNQ+8JF
	GgnqVxh3JXuAJxsKWH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8NUq-009Mvs-V5; Fri, 14 Jan 2022 14:24:05 +0000
Received: from mail-tycjpn01on20713.outbound.protection.outlook.com
 ([2a01:111:f403:7010::713]
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8NUn-009MsS-B8; Fri, 14 Jan 2022 14:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhPTRvbbg1XO2COx2NF1JSm8mrtlhNe9ExcecXvQl3gGl1xaBd4w68ZeNeLhnfCK4QmW4SP5er+Z/lcC3DprgV3cE9y7qyOzbX/YT2OCgNowNq/e7dvA5WAnFsiU+bxZAXghNgcisqfLqG6YVJRYi5yCDfOKfAJs7H90OZapWhRwIZ3pjrAq2SYZpa1c5i0w2BhHfzjbDS93/VUJkrfJFGgHlVoYFf3l1N+1QGTiExRIpD6t0uZorigSNhNaHvWCRP+k01xxbjCFchGAoWXODGqvbhiR5Axyr9Ez0ooE4Jxckln5bMmZ43bfPDQ51T1ji08UNLWcIp25Idx1Nc0ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jq+4mE6T1ROoicR6OSAD//TX5OjckAVQ1aqcdatgFYc=;
 b=EshJ/sSKtFqaf5/KFmVaz6nVjQj93dMJ+JURD3G3zPQvlML7sxvZuvTKlxRKRO6XiZ7DTS1Xa3ychiZu5zDIHSdnteDMvOGll6kr3dt7T3waCFtCKA0tA9wwSalIIAsq8IPQ2QXAXiP5vKtGELReaQfG/xBfhFFsefxOj9f7P2hHiduKxxWFHG9Oslgw0oaUMuGRdCq2bmLHGaA0bbAo8hVff52iU3gTN0HMqCGf6m5JwBSe/N1GtG4eSBeU7gEVMCoujQ6JU74sOKRbrjRvoOLwAI0AAB3aEEUxPiCAXwFqq4+bShcrTRDdb9NfYbIbq+b+bLEIIgKwnUTuBEoZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq+4mE6T1ROoicR6OSAD//TX5OjckAVQ1aqcdatgFYc=;
 b=o5RkVasKGRIWHaUCdH4spZEKpRSLY9OgWXc3ppFkY4/xfFl37InKgaYFdbzyk1S3x7TVTUfQgKsVrIL30x4H+73TMv8o+irxKpp0asboqLIz7Sl84WqhK+kgHMH35tZWA7QHG+geQ2nvqvGlAdWpSWat4swxhImebQ4MpC/MEw8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7459.jpnprd01.prod.outlook.com (2603:1096:400:f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 14:23:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 14:23:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Fabio Estevam
 <festevam@gmail.com>
CC: "daniel@ffwll.ch" <daniel@ffwll.ch>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Topic: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Index: AdgIo2084AmwtmkvSTyKeewhRhjVqAAFPAUAABnsh4AAABPrEAAExHWAAABoAuAABl2YgAAAt2ew
Date: Fri, 14 Jan 2022 14:23:52 +0000
Message-ID: <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
In-Reply-To: <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 023dc931-9603-47cc-60e7-08d9d7697d7b
x-ms-traffictypediagnostic: TYCPR01MB7459:EE_
x-microsoft-antispam-prvs: <TYCPR01MB745996234E722C919E98888086549@TYCPR01MB7459.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XaSvBaZgsrUZATKFk8FJDoc9gRGfB385ajyWCEoBoFIyLiMG1IszEErV8XvUiAJdWPLj5ATYc1U9h6Frx+ftZzAb61ljtmdxjSuS07SLr7whypbErQhCFjDbUWU1inOud8n+lLMyAbzHj+mRpIjf820Ymh4x1e/GdjYQ+8xNw9RiVVBRJDzWgq1Yl/BUANCq40R7toxWGEfmPRYjC4rJVmTk7gfppfFwznTEnMdtFzywp7VN3RmrngzgS+y7LHEPc18OUjqjfLBqirkiLNN+gSeO+wCPBaK2WynZofv9ZIrQrQd7wmP+BKapd0wmpsUW+dQZZtgE5vuecchmH789SRPzY2Ez/fB8uvYhzomY4Sd/8JtzrkFbfN9x3pZ462oZY/sqv/KXXHRJRxAJY+Q/trVgIHUKA3kdLIZrYzx9AAVzDzJJjrKmFTWwTgVWM8d06HS9OdRF6Q7O4lkvOzje0DX+MhQJlfVS8hj9Edcfd+xlpokxF3t/+7kRjh9C7tSvvCthSKSBFbp65foDrbTKklPryxcRceyock/uUfy1iLWDRG0QvEVigJXTX9AMdGKav8lTJdY9RM3UTHLOhgoPFC7bhS0z5KL/mL3o2YiYdg/TrZID8tLDAzAM3ItJZ9iE0s+rwvNP8NslNN800dosxedma04G9JVoRagPvCQNOGMUlMt+JYlyRTdJNVkXQ5TKF20OQN3MFIpQQKtLfw5C1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(66446008)(66476007)(38070700005)(8936002)(66556008)(7416002)(64756008)(110136005)(5660300002)(52536014)(8676002)(71200400001)(55016003)(66946007)(186003)(76116006)(26005)(9686003)(2906002)(316002)(53546011)(6506007)(86362001)(508600001)(33656002)(122000001)(38100700002)(83380400001)(7696005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVBiZmVRY1d3c1Y5RTc0dStrRXlnbUJweDBaTTVxZVBsMWd5RXA4NnNjK3la?=
 =?utf-8?B?V2R6ay9FVmU0RnJ3a0tGazdydFlNTE9TdGtDUTVITzFhcG5xRXZTaHhLdDFG?=
 =?utf-8?B?TG01ZEtJa0xJdEovN2F6a2RpMm1pbjFDNVA0YjZwYitmbm05blh3YTBOV2FR?=
 =?utf-8?B?RTdoYlZlRy8vYjF1YWZCNk84ZFJCMUFiOGVNTXAyNnM1MFdXOTJKeUdlNmxS?=
 =?utf-8?B?OUNnMURMTXNtZC9RVzhnZDBlWDQrL1hrNXV1Nld3OGNNQWZqWWxKME5Ta0V6?=
 =?utf-8?B?c0w3RWlLSi9NOEFkTTNsSW53R2JtR1hLVndiUnFjTHVWSklKMkd6T1R1VEJt?=
 =?utf-8?B?QWtGRW5yM0ovQk1telZSVkhMalAvb3ZONGVYVmR3QVp3SDlrZ1diRkl0d1pO?=
 =?utf-8?B?cmkvQWhWaVZFdU1PUC9DRTZ2Slh2ZTJMTVFNQWxoaHZsTHdOd05tYno2Undw?=
 =?utf-8?B?cFhVUU54enVBeHF3c0tUTUtEVTBBQTNaSW9sSGZobHpvbFJMZStkVzRLV3hY?=
 =?utf-8?B?aTJtMFBXc3pjNzUxb2J1RURCUm1oS1FFcFZvODMzTEZFT0tMUzZjSEZoeXF0?=
 =?utf-8?B?VTV1MXo1Z1lMS09NTSsycGZITXhjZFlVbTFOcTJCN1pXVWRpUEhITnZJbWFk?=
 =?utf-8?B?a1lISFY3bWVwY2NCU25PR0VWd2pmMldYL0c1c3psLy9IRVE5bGtZckxXOTJC?=
 =?utf-8?B?VGhGbllkTytzeXdXazNtQU5SQWN4WVVpVzZGNmlmSmxPaVp5ZEp1VHUxdjdU?=
 =?utf-8?B?T2hPamhNMGYvZm0rWUJialg5Mkk5MnR1Tm54T21VTWwrbVFnbjFHUnlEUy9T?=
 =?utf-8?B?OUQwTEdlN0FONDFra3hiTHExNk5hanErTkNyWGx5aGxSZlgyZkV5M05Jd3J3?=
 =?utf-8?B?bm5jRXVDQkk2VUt2Z3pTbGZqdS9HekZJazM0UXlBYk04TTROTk1oRVJmY2c5?=
 =?utf-8?B?TmNaK0w3d3paK0tObERySEhlYzRPdGxSeW1iWTNEYWt1RDk4aE9VQlo0bDVj?=
 =?utf-8?B?dTRkK2FsS24rRnZ5VENES0lCaFhwZ1V2bllIZHFvZ2dpa1dkYnZwcTZMODJl?=
 =?utf-8?B?VnM2VU15Y1JEL2dPTXNKdlc1YXBkbHV1aVpYZHdiWmZ4VW5NbkRheUF4WFFJ?=
 =?utf-8?B?a2pJc2tmNm8rMldHTm1HS25YN0hueU5OQmVVcUpzMHNJQWRKdjdBZlBBSytp?=
 =?utf-8?B?Qmk4NGxZNHhXRG1BUkVZbWRlODZtbGFHMnhFWVZPK2VURHdZVS9ySUx5QzJu?=
 =?utf-8?B?ZWtMcmNqcGxOUlZwNXJaSWxNU3VjRnVjaHdoUTRzOU1la2EzRjhGUEs5R0JT?=
 =?utf-8?B?K3VrS05PaXRNSHI1dmp2bU1ENVlla2NNNE4xZm54dTl6VHM4QlVMLzVtMWhE?=
 =?utf-8?B?K1B3L1g3VDViSnNDcjBvdDNzaHR4TlFST2tLQndDN1dzcEdCblFJazFOMmRP?=
 =?utf-8?B?L2pSWWtHZFFDMmkzQ01nb1BsVXZVc2Flelg0alI0TUVpZ0FvU1M5cEFSemxm?=
 =?utf-8?B?N0VsaVBRZ1JTdi9WNGZZS3Z6MVM5dDBnbk5oOVJZKzJQZHFhM0NqaVovTExH?=
 =?utf-8?B?TWh6WnJJcmNSd2tVNWxLdk4yeXExTXpna3Rhc0U3ZWtyVjFnT3BjSzIzUFU4?=
 =?utf-8?B?YVFqOGZEa2FLckVoVWlDcFFUcEd0ZFhYaDRMdzZzcEd5U3BobUlDVDV3VWMw?=
 =?utf-8?B?dXFrbDdZWW9GNVRBcngybDhFMWw3aEJsa241WlVkVFZEQXRIUDFyQlJxMzlI?=
 =?utf-8?B?TVhFQUNDOXRRS0VjR1BFc2VLTU9waXJ4UnhXQlZGOUgrQlQ5Q0NCQlQwRkhE?=
 =?utf-8?B?cGs5UVcwSGJTK3Y3Y3Z6dTB4OTlJNTRmU0U3OXJIeFlib2RLOUlYemgwNm1p?=
 =?utf-8?B?L21JQ3hrTTNkUC9OdjluTmVLNDJlYW5YV0o0Y2k4MG13bXBTOFYrSjBDNVBP?=
 =?utf-8?B?VXM0Ulpxb0I4eXlTWFRNbTBQVnM3QVJGL2VtSXZlT1lLaUF1MVdHa084bXkz?=
 =?utf-8?B?b2xJZnhxaHp4QTcyTHdsYkJNWDBwOXI0NDQ4bGhWQ3VmQkgrOWo4NEhuWlRR?=
 =?utf-8?B?cWFmQ1V0bkdINkxzb0cyNFdRbTJOM3JaZkRpaDVNRGUyM3M4SG1OWWZtajkz?=
 =?utf-8?B?c3ZVL2s2UVlHazExUnhkYkJzS3pnSXdHd0tkSURXYU5ucHhEVDdmRFJ5Z21w?=
 =?utf-8?B?dlhlQzZNL2t5d0diUE1Fb3I3NUZucEtoRGFnVTJKWUxBaXFrbVhBMzhZekk4?=
 =?utf-8?B?U0hSUkM0R1djNGVsREVUUGpIU2RRPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023dc931-9603-47cc-60e7-08d9d7697d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 14:23:52.5474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3q7x/eIsoC79AyGTSWYlmhNk4vvLGLyW3QYW0QwLyTIX+g8A7BMPGK3nuszqbsMayzBkyt+oZCgC7uUtW6mUxp7ILQRFaO3RlJw+j7pgdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_062401_531395_A7C04F81 
X-CRM114-Status: GOOD (  28.14  )
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



> -----Original Message-----
> From: Neil Armstrong <narmstrong@baylibre.com>
> Sent: 14 January 2022 13:56
> To: Biju Das <biju.das.jz@bp.renesas.com>; Fabio Estevam
> <festevam@gmail.com>
> Cc: daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com;
> robert.foss@linaro.org; jonas@kwiboo.se; jernej.skrabec@gmail.com;
> martin.blumenstingl@googlemail.com; linux-amlogic@lists.infradead.org;
> linux-arm-kernel@lists.infradead.org; dri-devel@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> Subject: Re: dw_hdmi is showing wrong colour after commit
> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> callbacks")
> 
> Hi,
> 
> On 14/01/2022 12:08, Biju Das wrote:
> > Hi Neil,
> >
> >> Subject: Re: dw_hdmi is showing wrong colour after commit
> >> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >> callbacks")
> >>
> >> On 14/01/2022 09:29, Biju Das wrote:
> >>> Hi Neil,
> >>>
> >>> + renesas-soc
> >>>
> >>>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >>>> callbacks")
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 13/01/2022 21:01, Fabio Estevam wrote:
> >>>>> Hi Biju,
> >>>>>
> >>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
> >>>>> <biju.das.jz@bp.renesas.com>
> >>>> wrote:
> >>>>>>
> >>>>>> Hi All,
> >>>>>>
> >>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
> >>>>>> till the commit
> >>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
> >>>>>> fmts
> >>>> callbacks").
> >>>>>>
> >>>>>> After this patch, the screen becomes greenish(may be it is
> >>>>>> setting it
> >>>> into YUV format??).
> >>>>>>
> >>>>>> By checking the code, previously it used to call get_input_fmt
> >>>>>> callback
> >>>> and set colour as RGB24.
> >>>>>>
> >>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
> >>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback,
> >>>>>> I see
> >>>> the outputformat as YUV16 instead of RGB24.
> >>>>>>
> >>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
> >>>>
> >>>> This patch was introduced to maintain the bridge color format
> >>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
> >>>> seems it behaves incorrectly if the first bridge doesn't implement
> >>>> the negotiation callbacks.
> >>>>
> >>>> Let me check the code to see how to fix that.
> >>>
> >>> Thanks for the information, I am happy to test the patch/fix.
> >>>
> >>> Cheers,
> >>> Biju
> >>>
> >>>>
> >>>>>
> >>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
> >> shows:
> >>>>>
> >>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
> >>>>> HDCP (DWC HDMI 3D TX PHY)
> >>>>>
> >>>>> The colors are shown correctly here.
> >>>>>
> >>>>
> >>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the
> >>>> negotiation fails and use the RGB fallback input & output format.
> >>>>
> >>>> Anyway thanks for testing
> >>>>
> >>>> Neil
> >>
> >> Can you test :
> >>
> >> ==><===============================
> >> diff --git a/drivers/gpu/drm/drm_bridge.c
> >> b/drivers/gpu/drm/drm_bridge.c index c96847fc0ebc..7019acd37716
> >> 100644
> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> +++ b/drivers/gpu/drm/drm_bridge.c
> >> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
> >> drm_bridge *bridge,
> >>         last_bridge_state =
> >> drm_atomic_get_new_bridge_state(crtc_state-
> >>> state,
> >>
> >> last_bridge);
> >>
> >> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> >> +       /*
> >> +        * Only negociate with real values if both end of the bridge
> chain
> >> +        * support negociation callbacks, otherwise you can end in a
> >> situation
> >> +        * where the selected output format doesn't match with the
> >> + first
> >> bridge
> >> +        * output format.
> >> +        */
> >> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
> >> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
> >>                 const struct drm_bridge_funcs *funcs =
> >> last_bridge->funcs;
> >>
> >>                 /*
> >> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
> >> drm_bridge *bridge,
> >>                 if (!out_bus_fmts)
> >>                         return -ENOMEM;
> >>
> >> -               if (conn->display_info.num_bus_formats &&
> >> +               /*
> >> +                * If first bridge doesn't support negociation, use
> >> MEDIA_BUS_FMT_FIXED
> >> +                * as a safe value for the whole bridge chain
> >> +                */
> >> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
> >> +                   conn->display_info.num_bus_formats &&
> >>                     conn->display_info.bus_formats)
> >>                         out_bus_fmts[0] = conn-
> >>> display_info.bus_formats[0];
> >>                 else
> >> ==><===============================
> >>
> >> This should exclude your situation where the first bridge doesn't
> >> support negociation.
> >
> > I have tested this fix with Linux next-20220114. Still I see colour
> issue.
> >
> > It is still negotiating and it is calling get_output_fmt_callbck
> >
> > [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> MEDIA_BUS_FMT_UYVY8_1X16=0#########
> > [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> MEDIA_BUS_FMT_YUV8_1X24=1#########
> > [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> MEDIA_BUS_FMT_RGB888_1X24=2#########
> >
> > And In get_input_fmt callback, I See the outputformat as YUV16 instead
> of RGB24.
> >
> > [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
> MEDIA_BUS_FMT_UYVY8_1X16#########
> > [    3.473644] ########hdmi_video_sample
> MEDIA_BUS_FMT_UYVY8_1X16#########
> 
> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to the
> encoder.

Yep.

> 
> Let me figure that out, no sure I can find a clean solution except putting
> back RGB24 before YUV.
> 
> Anyway please test that:

It works now after reordering.

[    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=0#########
[    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
[    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=2#########

[    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_RGB888_1X24#########
[    3.506797] ########hdmi_video_sample MEDIA_BUS_FMT_RGB888_1X24#########

Is it acceptable solution to the users of dw_hdmi driver? May be it is worth to post a patch.
at least it is fixing the colour issue??

Regards,
Biju

> 
> ==><===============================
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..68f79094f648 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2589,45 +2589,44 @@ static u32
> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  	}
> 
>  	/*
> -	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
> +	 * Order bus formats from 16bit to 8bit and from RGB to YUV422
>  	 * if supported. In any case the default RGB888 format is added
>  	 */
> 
>  	if (max_bpc >= 16 && info->bpc == 16) {
> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
> +
>  		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>  			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> -
> -		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>  	}
> 
>  	if (max_bpc >= 12 && info->bpc >= 12) {
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> -			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> 
>  		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>  			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> 
> -		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>  	}
> 
>  	if (max_bpc >= 10 && info->bpc >= 10) {
> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> -			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> 
>  		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>  			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> 
> -		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>  	}
> 
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> -		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> 
>  	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>  		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> 
> -	/* Default 8bit RGB fallback */
> -	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> 
>  	*num_output_fmts = i;
> 
> ==><===============================
> 
> Neil
> 
> >
> > Regards,
> > Biju
> >

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
