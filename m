Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C4C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5E7Nm04rpCwAaJdyLT2LCRo0x/j6830H4gOJtjdPTc=; b=E4PBzblezJc3Eu
	J0tE1wSC/n8b7U1pUBXBoJZQsa/RR6R8yG6ptGHul5erVtVcOS9qImURLmYg3OCoFLPG0fKZ/mWwW
	0R1OYNXIfP/d9lXHTyezUzY9F2vKU5NW6uXsNpaXa0AaCMx+GUEJKqRRSk3Hvi20ODBYayjSRGg1c
	bbl6NG1lnR6r35q9IWDmXESEsNwq2/RjSHjBlALeiQWn05XSQpkTvuhb5p7rXZD+unfRA9heTrcXA
	n4XY0rjk3i8Qszv8bebjvxPCUoNlIWOC+CQC7KO1lQ4jUIgTyWC4NQuhO60diV4PHVDMqYyCJW9i9
	rVUbVW5wQv4A4f8rYN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9QuE-00Eq0c-QK; Mon, 17 Jan 2022 12:14:38 +0000
Received: from mail-os0jpn01on2071c.outbound.protection.outlook.com
 ([2a01:111:f403:700c::71c]
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9QtN-00EpZy-Re; Mon, 17 Jan 2022 12:13:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI3lurmhZh63OBpt0vgDZBMs3bOTdXX+2++kEnmpk2sPUzyrjXyfde76ULrfl1mHzs365viueMaB7ZlJZTOsCC0v4xTrf5NJYXy4GePHrbJra6pFziXxyOKb9RlVYnJGo7sgyz0BfIrkr3yfYP3CNFZQePe8pLwG//VSnFkoh+tLYN2D0Kvb/NYxrEl/kqtCOpnGS+0F+74vZKXG4CkPoG8rmreN3FrvrnacOg/4LHlBKm86aWvLZmfYzsN4Fq3pGoEF9t6iZHZkgQfYGTl5JkmpOL8eesFRSe9smo/DoQbVDeqhcTBfFzynckRxvFjVUakMIQ0+whlDcItK2kT/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48g9HGD3Ox9jcs20YVnxF5M+3pb5yESJ86JGheBVC+s=;
 b=m2ytVEjtGaKWLovAUjpNNJPHVdgvhmAtDfQJYFTcluK4HSoh36Qbb9xCh8IUFDDNBt62HBg3HMbwUposXqdFJnnH9eHWk8akYq321ObhgkPrrGAOwLZt0tjl1c2yHM+lc+33oYkTYACtwQ0JvrDzF0I29m/zMOLTKaUjGW7b8tdOj5XE2OZPJth7lDSyDQBEm4/ISZPzXl8tGwptsCDUzXEaUgS0xApUol6mhF6gjyh4VLEePxKvN1KvNkCERID7e3CSYr5n0/4mnCxCjBGkPNv98GVnK5TMU1r0+TXdMJ5ePsdPwYsPWpjqYX5BkLnFdSaAAIoH+rJX32M+brsgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48g9HGD3Ox9jcs20YVnxF5M+3pb5yESJ86JGheBVC+s=;
 b=DvjVXEBhOZImtKBH90/kVooGx/GqrAwH8m2+KGEaa6WyG95vP2HqVUpasi9/512TeC1wdIzmPsOaKK/8Fh/VQcLJ2eu6l5mJiUPzGsFb7D2YHY2VaA3cljrF+54ai7Rma6MLBHiWuTiTE3NdPRrTtHK2OMpsJ0iK3yvm5zqAFgY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4564.jpnprd01.prod.outlook.com (2603:1096:604:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 12:13:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 12:13:36 +0000
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
Thread-Index: AdgIo2084AmwtmkvSTyKeewhRhjVqAAFPAUAABnsh4AAABPrEAAExHWAAABoAuAABl2YgAAAt2ewAADVHgAAjV4nAAAEGsHQ
Date: Mon, 17 Jan 2022 12:13:36 +0000
Message-ID: <OS0PR01MB59224F0F892D6F86DBD5D36286579@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
 <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
In-Reply-To: <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce51d8a0-08bf-4524-4102-08d9d9b2c9dc
x-ms-traffictypediagnostic: OSAPR01MB4564:EE_
x-microsoft-antispam-prvs: <OSAPR01MB4564970E034D85490747359086579@OSAPR01MB4564.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y7/MJcZwF7sZh0IajeGPcFGOMYws23ieIhiMrwvNONTKg3bFbLy6MJwX+jv+SW+/20MD+0kKXPY9JjppeExNKei2gPcoBsrB6djyIplaBCwsPZMKTvIaBhOBoqsYWsmQbP+fYZiRF18mGnW4LjBTStFxXuNfKlzNEpGwnkqoTxxjveQMSp1KABFZimammhVEY1r0/WtwyYTZTxYaLI+PV3nUbp8R7gnTNYgY7yLjWyFyitWRO7fNgIlUtzDCcuRbBJ2wEerALErXVcb1BPKrqIgbN1Z8VJOJaRT2ayobWy6qE2Gpz7ER7qrVErk7Bqp7uYLJmOLO0ars4dSBCpp+TYJXvgl9Y1asdXvwFJa1Iwq7vdpjt1/jvNkYW8iVEsHX+HvKf73+wMJK9V5vBJwBOpsHxm7CiSqVzLNTP8IJiBuXefV6KOryVQQixX3G5dwCCEa1WRaQyOtKYdYplayW41SMTOYDLDNGMl79a8+7IgILCIxxnQP/B+yzg/kqcFFJLG4o1zG1PU5BvXYVVLemFwaXx0obHbFb4GaImZV0KWoCbrWFosCmv2nKAN7L1kdk70ST8+k0kvwjg8ZEIKMlhSI2AcYU9Iim8xWwtsQGHpCOc2FHCr+QiE5GVhtBJWVdEHitgKaOYSEXFnKT61znHrJEEWAdVEsA0GQEY/EMl6U5mNYZCu1CaFdN8n5nTOIwhf5Uf45WqvNwX5358s9oMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6506007)(38100700002)(53546011)(26005)(186003)(8676002)(5660300002)(71200400001)(8936002)(55016003)(33656002)(7696005)(122000001)(9686003)(38070700005)(316002)(110136005)(83380400001)(54906003)(76116006)(7416002)(52536014)(86362001)(4326008)(66946007)(66556008)(64756008)(66476007)(508600001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEh0bzZrNGV4bnFLR1dIdEI5dVNlWmdMT3dKdDBHQjNzeEwyYSthODY3UlFq?=
 =?utf-8?B?c1dOdkNjblNCL3JzeWcwU0V4NTNZak0xTHloOTVnM0I3Rm1hVWE2bVV1eHZn?=
 =?utf-8?B?a3FxdnFGWkJFTCthR1BiY3JPYzlobU11THNFWW01QURMMk5ZMWNReFBKeldz?=
 =?utf-8?B?WC9mZTNORUhMcDhpRXkvbFZZODdsMzRObXpCdDg0VndKMjJTUENBbzBpdE5a?=
 =?utf-8?B?L0V5WVg3amV5enEvRkpOK1M2Zzg3VE0waDFBVkx2Y3Z2RWtvay8zRjdnRGdQ?=
 =?utf-8?B?SEhwVTRSZ1hjRWpRVnV4NTZEQ1JQSnJ0aGxyL04vem1CbGZONHhJOHVTK1dk?=
 =?utf-8?B?U3BhYmt4emhGZlNNbC9udE4zODlEWlNYbXN5R005dmJDbUdodXoxZW5seVRq?=
 =?utf-8?B?MWZoWGd2UDhhRzg1c2JCT2xRa0UyV1hrSWg0Y1hLN05jaEZLQ1pJejd3N1hu?=
 =?utf-8?B?Wjd3YzRFb3ZnMkhLaDM0WHpvRUIreXBIZVZ2YjA1UVo3QkhVWlp2WDc1aGpo?=
 =?utf-8?B?dVhLc1lKbWxFclhGWTg4RHdpL3JqU3F0NWwySzF4ODd0eGZVcmVoUVB2U1pZ?=
 =?utf-8?B?QmNtWnRzK1I0OXhLVFFUZyttZ1dzQjFzWkx1M2V5enVIdmE0YTJvK3kwT2hs?=
 =?utf-8?B?bkNNbTZaMU5Zc0toa3AyaWxRYkh6SWQ1NWlnZmF6bk9lK1pWdHpqRDBaVzln?=
 =?utf-8?B?bjFuempJYWM3SnJVeldJRjdhNVFKdEJzTlUwU2tpNkxIajlSNERmYXdhVVdn?=
 =?utf-8?B?UzdDUitSNjBwcGk4NGxEaFhXeGdyZ1JNZzdyNk9sdGZERWI4OUNmVUhvdFR4?=
 =?utf-8?B?dWZRUnFscG9lbUNzUm9tVlV4REJmQVRUYi9CNEoyQlkyeHZ5YXRwYUl4M3RE?=
 =?utf-8?B?SGNsYkw5c2w3VDd1bmJxWk9EemlrZ01yTm15azVFUUpnbHkrcm9ORGcvYldB?=
 =?utf-8?B?TzNsQmREaENKbWx2NUZvTmNjT1N3bVA3T1hnVzhsOE5JQmhvdDlYaFhLSUZv?=
 =?utf-8?B?N25CbW9hcW9hUnBVaEhVbVl2RXhCb3ZhTEo1U2c5QUNFWDlYUVlveEMwUkxq?=
 =?utf-8?B?QzVib2JCcXJweVRqK1RZNnArd2w0Mng2NnBOTnZyTXc5U0tXck5iSjBqd1hk?=
 =?utf-8?B?b3l5Q2d2VjMveHlIaDkvN2l6NFJZWVBIZjBpOUVGRVFnVE4wVzBwZkxjNnhN?=
 =?utf-8?B?TUF1QXdoaUFsLzVBZFpER0hxMjk1c3BLdys3VWFicWtnUHdnSThMN3lPaUNH?=
 =?utf-8?B?SkNJeDFKcHltTjhHdWtnc1NnRUdIeHNFQzdrR3pKbHc0R0dOcW9CWXN4S2l4?=
 =?utf-8?B?WExSd2M2S1g1aWR0RFcvNWhGdlhra3hWRnQ4N2JxQ1JkVWd0aXJteGFTTVBX?=
 =?utf-8?B?MjVwckJpSGdRVERZMy9TaVYvalQvSk1JUTJNZmFjaCtaUTFEOE9lZnk5ZFpI?=
 =?utf-8?B?blRSQTdmVnZ5aXEveFFSSHpCTmZ4MkRKQ25SR21kcGMydVp6ZkVBR05VTUtU?=
 =?utf-8?B?TXdTUHMvQXV0SWRMdVN3VG1yT2EvUjZGd3lZN0t4dUd2ditSenR4WURVcTAv?=
 =?utf-8?B?Qjd3dEdzNllSVDZxZDdlM2dLRkcvTSs2MWFUN2pSVHNWajZ1TFc0K2NrK0ww?=
 =?utf-8?B?TEpZNWtlSTZNcTlrN251cG41MkI1WCtPd05HUHdZcTRsZEZkeXFKLzAxNTZF?=
 =?utf-8?B?bnNxQlREL0tHdTNuSDJtM1QxOFltQTNWSXFickFjbjhSdWlxWENHWG83Ri9a?=
 =?utf-8?B?TnpLWTBFdWUzZ2VkUE84MURVZXRJTDAvazl6djlLZ2hmQTNCUm0vblh3SVlw?=
 =?utf-8?B?ejYxUklCcUUyRlJvZzJvNFpuUFlTZzNRU3dZMUJpUVo4WVlhaks2NWJKeXlG?=
 =?utf-8?B?TWtRbFkzSW5wZWNjbklzc1B6WTd1cFBwRTY5MUNPdE1RczBZaTVSMUYyUXhB?=
 =?utf-8?B?a3FIK2lUeUc4SldSMVVtWFhNZUZhSXI4NEl5YVRnUDUwVWR1QlN3cnNCR3Bv?=
 =?utf-8?B?SzNrY0crSEhCWERKdis5RWFKRXZFYlJKQ3ZMbUg2c0M3b05KMDcrSHF4eVBW?=
 =?utf-8?B?T2hobExMK3hhVi9VRmpmTFRrbE1hV1A5NjNqa1NQTkNkS28wRjJOZ09aVmh6?=
 =?utf-8?B?TjE3UHVWTHVVWGY2cHR1L2dxb0Yra1ZrWGJKOWliZTQzb3E1Z2QwamZsOXAw?=
 =?utf-8?B?S2kzUFFkaTlMOHR5NkRBSmUzTXdyeE5sUGsxQlI1cEw2dUphaklURkhtZ1gv?=
 =?utf-8?B?RU9Jcm9ua2doTlpMckpHd2UxYkJ3PT0=?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce51d8a0-08bf-4524-4102-08d9d9b2c9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 12:13:36.2759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99oSN673OfDCTig1fVoyOc0FS/QqueB9KgKCx6yw/Rnv0UhVYJ5B5q7XtfBCVQalw5d71TEQV0sfcjv15SZq+rXOZU74lZEVfpYl58cuU8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_041346_074384_023D7C67 
X-CRM114-Status: GOOD (  23.27  )
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

Hi Neil,
> Subject: Re: dw_hdmi is showing wrong colour after commit
> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> callbacks")
> 
> Hi again,
> 
> On 14/01/2022 15:40, Neil Armstrong wrote:
> > Hi,
> >
> > On 14/01/2022 15:23, Biju Das wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Neil Armstrong <narmstrong@baylibre.com>
> >>> Sent: 14 January 2022 13:56
> >>> To: Biju Das <biju.das.jz@bp.renesas.com>; Fabio Estevam
> >>> <festevam@gmail.com>
> >>> Cc: daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com;
> >>> robert.foss@linaro.org; jonas@kwiboo.se; jernej.skrabec@gmail.com;
> >>> martin.blumenstingl@googlemail.com;
> >>> linux-amlogic@lists.infradead.org;
> >>> linux-arm-kernel@lists.infradead.org;
> >>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
> >>> linux-renesas-soc@vger.kernel.org
> >>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >>> callbacks")
> >>>
> >>> Hi,
> >>>
> >>> On 14/01/2022 12:08, Biju Das wrote:
> >>>> Hi Neil,
> >>>>
> >>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
> >>>>> fmts
> >>>>> callbacks")
> >>>>>
> >>>>> On 14/01/2022 09:29, Biju Das wrote:
> >>>>>> Hi Neil,
> >>>>>>
> >>>>>> + renesas-soc
> >>>>>>
> >>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
> >>>>>>> fmts
> >>>>>>> callbacks")
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
> >>>>>>>> Hi Biju,
> >>>>>>>>
> >>>>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
> >>>>>>>> <biju.das.jz@bp.renesas.com>
> >>>>>>> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi All,
> >>>>>>>>>
> >>>>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working
> >>>>>>>>> ok(colour) till the commit
> >>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
> >>>>>>>>> fmts
> >>>>>>> callbacks").
> >>>>>>>>>
> >>>>>>>>> After this patch, the screen becomes greenish(may be it is
> >>>>>>>>> setting it
> >>>>>>> into YUV format??).
> >>>>>>>>>
> >>>>>>>>> By checking the code, previously it used to call get_input_fmt
> >>>>>>>>> callback
> >>>>>>> and set colour as RGB24.
> >>>>>>>>>
> >>>>>>>>> After this commit, it calls get_output_fmt_callbck and returns
> >>>>>>>>> 3 outputformats(YUV16, YUV24 and RGB24) And get_input_fmt
> >>>>>>>>> callback, I see
> >>>>>>> the outputformat as YUV16 instead of RGB24.
> >>>>>>>>>
> >>>>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI
> driver.
> >>>>>>>
> >>>>>>> This patch was introduced to maintain the bridge color format
> >>>>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
> >>>>>>> seems it behaves incorrectly if the first bridge doesn't
> >>>>>>> implement the negotiation callbacks.
> >>>>>>>
> >>>>>>> Let me check the code to see how to fix that.
> >>>>>>
> >>>>>> Thanks for the information, I am happy to test the patch/fix.
> >>>>>>
> >>>>>> Cheers,
> >>>>>> Biju
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board,
> >>>>>>>> which
> >>>>> shows:
> >>>>>>>>
> >>>>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
> >>>>>>>> HDCP (DWC HDMI 3D TX PHY)
> >>>>>>>>
> >>>>>>>> The colors are shown correctly here.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the
> >>>>>>> negotiation fails and use the RGB fallback input & output format.
> >>>>>>>
> >>>>>>> Anyway thanks for testing
> >>>>>>>
> >>>>>>> Neil
> >>>>>
> >>>>> Can you test :
> >>>>>
> >>>>> ==><===============================
> >>>>> diff --git a/drivers/gpu/drm/drm_bridge.c
> >>>>> b/drivers/gpu/drm/drm_bridge.c index c96847fc0ebc..7019acd37716
> >>>>> 100644
> >>>>> --- a/drivers/gpu/drm/drm_bridge.c
> >>>>> +++ b/drivers/gpu/drm/drm_bridge.c
> >>>>> @@ -955,7 +955,14 @@
> >>>>> drm_atomic_bridge_chain_select_bus_fmts(struct
> >>>>> drm_bridge *bridge,
> >>>>>         last_bridge_state =
> >>>>> drm_atomic_get_new_bridge_state(crtc_state-
> >>>>>> state,
> >>>>>
> >>>>> last_bridge);
> >>>>>
> >>>>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> >>>>> +       /*
> >>>>> +        * Only negociate with real values if both end of the
> >>>>> + bridge
> >>> chain
> >>>>> +        * support negociation callbacks, otherwise you can end in
> >>>>> + a
> >>>>> situation
> >>>>> +        * where the selected output format doesn't match with the
> >>>>> + first
> >>>>> bridge
> >>>>> +        * output format.
> >>>>> +        */
> >>>>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
> >>>>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
> >>>>>                 const struct drm_bridge_funcs *funcs =
> >>>>> last_bridge->funcs;
> >>>>>
> >>>>>                 /*
> >>>>> @@ -980,7 +987,12 @@
> >>>>> drm_atomic_bridge_chain_select_bus_fmts(struct
> >>>>> drm_bridge *bridge,
> >>>>>                 if (!out_bus_fmts)
> >>>>>                         return -ENOMEM;
> >>>>>
> >>>>> -               if (conn->display_info.num_bus_formats &&
> >>>>> +               /*
> >>>>> +                * If first bridge doesn't support negociation,
> >>>>> + use
> >>>>> MEDIA_BUS_FMT_FIXED
> >>>>> +                * as a safe value for the whole bridge chain
> >>>>> +                */
> >>>>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
> >>>>> +                   conn->display_info.num_bus_formats &&
> >>>>>                     conn->display_info.bus_formats)
> >>>>>                         out_bus_fmts[0] = conn-
> >>>>>> display_info.bus_formats[0];
> >>>>>                 else
> >>>>> ==><===============================
> >>>>>
> >>>>> This should exclude your situation where the first bridge doesn't
> >>>>> support negociation.
> >>>>
> >>>> I have tested this fix with Linux next-20220114. Still I see colour
> >>> issue.
> >>>>
> >>>> It is still negotiating and it is calling get_output_fmt_callbck
> >>>>
> >>>> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> >>> MEDIA_BUS_FMT_UYVY8_1X16=0#########
> >>>> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> >>> MEDIA_BUS_FMT_YUV8_1X24=1#########
> >>>> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> >>> MEDIA_BUS_FMT_RGB888_1X24=2#########
> >>>>
> >>>> And In get_input_fmt callback, I See the outputformat as YUV16
> >>>> instead
> >>> of RGB24.
> >>>>
> >>>> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
> >>> MEDIA_BUS_FMT_UYVY8_1X16#########
> >>>> [    3.473644] ########hdmi_video_sample
> >>> MEDIA_BUS_FMT_UYVY8_1X16#########
> >>>
> >>> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to
> >>> the encoder.
> >>
> >> Yep.
> >>
> >>>
> >>> Let me figure that out, no sure I can find a clean solution except
> >>> putting back RGB24 before YUV.
> >>>
> >>> Anyway please test that:
> >>
> >> It works now after reordering.
> >>
> >> [    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> MEDIA_BUS_FMT_RGB888_1X24=0#########
> >> [    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> MEDIA_BUS_FMT_YUV8_1X24=1#########
> >> [    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> MEDIA_BUS_FMT_UYVY8_1X16=2#########
> >>
> >> [    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
> MEDIA_BUS_FMT_RGB888_1X24#########
> >> [    3.506797] ########hdmi_video_sample
> MEDIA_BUS_FMT_RGB888_1X24#########
> >>
> >> Is it acceptable solution to the users of dw_hdmi driver? May be it is
> worth to post a patch.
> >> at least it is fixing the colour issue??
> >
> > Yes, it gets back to default behavior before negociation, nevertheless
> > we need to think how to handle your use-case correctly at some point.
> >
> > I'll post this as a patch ASAP so it gets applied before landing in
> linus master.
> >
> > Neil
> >
> >>
> >> Regards,
> >> Biju
> >>
> >>>
> [...]
> 
> I'm not happy with this version since it's merely a hack which makes it
> work.
> 
> Can you test the following change instead, it's correctly handles your
> situation in a generic manner.
> 
> ========================><=============================
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..9f2e1cac0ae2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,9 @@ static u32
> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>         if (!output_fmts)
>                 return NULL;
> 
> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves
> */
> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +       /* If dw-hdmi is the first or only bridge, avoid negociating with
> ourselves */
> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +           list_is_first(&bridge->chain_node,
> + &bridge->encoder->bridge_chain)) {
>                 *num_output_fmts = 1;
>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> 
> @@ -2673,6 +2674,10 @@ static u32
> *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>         if (!input_fmts)
>                 return NULL;
> 
> +       /* If dw-hdmi is the first bridge fall-back to safe output format
> */
> +       if (list_is_first(&bridge->chain_node, &bridge->encoder-
> >bridge_chain))
> +               output_fmt = MEDIA_BUS_FMT_FIXED;
> +
>         switch (output_fmt) {
>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>         case MEDIA_BUS_FMT_FIXED:
> ========================><=============================

This patch alone fixes the issue. I have tested with Linux-next.
Do we need below code, as it is already taken care in output_bus_fmt callback.

> +       if (list_is_first(&bridge->chain_node, &bridge->encoder-
> >bridge_chain))
> +               output_fmt = MEDIA_BUS_FMT_FIXED;

Cheers,
Biju
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
