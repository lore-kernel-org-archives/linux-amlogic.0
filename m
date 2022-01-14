Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5BDC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yU9hioIp7eWf1SHCd3eRVBvdIldNzT72T/NurTHhHFI=; b=ATch3QRqy4Lvtz
	ouenqzI+TYQVio8om/5QnQ1er+XJUIlSGnz/BPTC81eAnb24Ejd7+/e+4gN/i4g+Be4ZPAyzhbtwT
	PwOO1vDXp05ilQrjX6Y5s7iCIKgBswXHTmAQEuOaEqxLEYrOLEf+V63U7a/DNU38nhGQYmDPHZ4IS
	b663hgplgMjnz0IPH0GJmJaWbTh0goHdBc3HIywSSc9a/AxUE+eVVjIZS5gXL3j9FMNYQwOoMRt0Q
	a1Hsa/q9447KzNiWqEXOn6dRcyiwmysf3pHNtN4uvU5DcgV9Khkru/1pZU5w3iFwPqU+54iO8vMhg
	7LQA5fKYmpsZcUg+YYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8KS3-008tGE-1y; Fri, 14 Jan 2022 11:08:59 +0000
Received: from mail-tycjpn01on20713.outbound.protection.outlook.com
 ([2a01:111:f403:7010::713]
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8KRx-008tDa-29; Fri, 14 Jan 2022 11:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYHifilvBFMLEAm2MzXzuuyTpzO2gFywPgyhiyvfUohreMuNfofRN5P2biCx9YlZfJ8h12cjzDjtYpWUCLF22p6xbnaRTXArgrOfjAgUZs8vQFSJ9E12F8PsDNcF58rhfm/nSBUl0NfMsFS2/CGyC4c+ZgkhlAV8sN1MaDszfVbxuEzcthHmuJRqxIvYl2cNAI9Iwjq+j4r59GIcV+Q13FkXEHesUIJo4Tm/tu1nfwMAPK/V9m8bmtdZoSZIoPxxFVWB/L/ZE++6ALqZsOaptozA5bkOkaHrBwduamRXQaymQ4V9Ec9e4e4Fqv4rT4W4hAjWOh0kkkF56N+doif/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEgK+tHVKuQ3CfeaQCOE7dWyqQeSYvZ/tPdeP7RlmX0=;
 b=gPva44IJk2sHqojdLaK1jJMES7lSw5SQkfG/bQYW0hJmNEbhwNgHfdQGHOiPxXLcM2LFfd053xGMRTv/xgnHRJoeEfuJJFs1SgBoTjAXu9yedMRem3Twh3y0smrs9HVLOsh98ew5NWMpQfBk2oQHMrEDMCq03b8TtYGJ6wiuErnzWtfcyy12stbUOwC+CIqyIHMIYdncf+lFPdapymrqKBnoXgRfQuhSTFdmxTmPiRlkW8lZqjuY262S98mmIJS6ozHuQQBFIxtCkaP5807sreXXDnmgmSNjDt0LxqlJJJwUy0tI+OyV+bfGWxsO87cbjDm/YBGwxgh8e1CQuY5q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEgK+tHVKuQ3CfeaQCOE7dWyqQeSYvZ/tPdeP7RlmX0=;
 b=cPlzd78juPRWZLNauL3mVC2xBC2LiIh7IgWe+tXdGAMthV67t6M8SVHwmQvI5APh54dXBxwjmzLpt1AM7JxbxuphzWPyejohL+de0X8lK7xj/TfREVWIA2d3jQdHuhUyRAcuvfz9Zy6lnecfAbfOkXyt0QSNrheKXVuNkEAciBQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2306.jpnprd01.prod.outlook.com (2603:1096:603:16::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 11:08:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 11:08:46 +0000
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
Thread-Index: AdgIo2084AmwtmkvSTyKeewhRhjVqAAFPAUAABnsh4AAABPrEAAExHWAAABoAuA=
Date: Fri, 14 Jan 2022 11:08:45 +0000
Message-ID: <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
In-Reply-To: <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e287013-6a7a-44f4-bdcd-08d9d74e3bc7
x-ms-traffictypediagnostic: OSAPR01MB2306:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2306DE123181DFEC58122D8686549@OSAPR01MB2306.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tBy6oVpWF+b23Zyq/WTz5zyXxJrKfgT0q8kDHcsK57UOTt3ev6p5IFBY9EjzJJkYiVyE+HyINPMyAeIbuPLOEahqIsJiypAjXp8sQkHcNpVmY8tuM7ROptY1dlwFhVwUPhak2ngz7UTKrdZz8KK/MPCcmHQMJw82+mLXSzUOJAYwuYzjytIcHUcyvpmanRcbY4bSiPoSUvVlzSfG/ivjVT2ZAr5nx4ytOtwHqfiHmqkLQqEcfafJlAgoJm4UznB2uZ8HjCZeW+9yB5PNLCOznaiQgc4B6+4MxnNjZhSON4QIdIQjGiwJ7YC83fsEbNgGTtiRPK+B6lQxPMrKokZZvGIAs72/5jgji96PjdKfJ76je4rMkNxR2DkGARDIXLonia4Ozvh6q8iye4lPVtJ//usOJXHVaivALLHyp25UPvRDJ4+KbAAYFG7QcB2wNaGCC19SPuEiRZawBTG0mEqKj3isdRuXw2/sRNcTogNIZNtrII2DcI7IZBQ4rri6Or+OhohmwFvb4yzj92Uge3al6plkvrcufE5ce4vVEppkY9jQZ/pTZbdYwaqBHFWvoDoi71GzgEcQmzEsYh3mH7O857X9Bd9dtHT7mReD/gBBuPo70hQKcxDSvbLowhUKJmbOtElQ+K8NZYxFasraOh3bY1SpOpwGQrdvk4Cw/GLrO7ekbOUeROFJ16wjZ/Hwlh6ghQJR9N3Q7h5V9aqJCYxZPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(5660300002)(33656002)(66446008)(83380400001)(66556008)(26005)(52536014)(316002)(8936002)(110136005)(66476007)(71200400001)(6506007)(55016003)(38070700005)(2906002)(53546011)(54906003)(9686003)(38100700002)(7696005)(8676002)(86362001)(186003)(122000001)(508600001)(4326008)(76116006)(7416002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjFZTXVFU3Yva3Vaam9UdHhzeHl3eDM1bUFtRjFZbmhteVoyUUQ1UVJDc3N5?=
 =?utf-8?B?WGlIY2ZQRUh1SnhWaWdQVnVhZ0tGQUZ4cWJPWDd5TlJLeUlLbDVQR0IvWTNy?=
 =?utf-8?B?dUQ0MmVOeWdvTlRWQW9wZkFrU1MzWjVGWldnSDU4SmxmZ1RCdlVTaDdYTFYr?=
 =?utf-8?B?MmRDNStiYjNGUXZ4UlIyWm9rUEFSczRacU5WM1d6YnBhbEgxVnhKT1d5QkZQ?=
 =?utf-8?B?Ulg5SE8zR0RlaVh6Tm9KQnNDeVoybVJoTGpCMkVZNzFiTjh1TlpoMHNHeFJw?=
 =?utf-8?B?dllQT2hFL2xQSWJXMXlsZnkzbkZVWHoyOTBaRHRVQ0djZ2NnNGczVENqNnNW?=
 =?utf-8?B?dVYzWi81YmFoNGZsVFhsVGxqVTVPcTBlRzZlVlhrcmo2U2cxeFVjcjkwNis1?=
 =?utf-8?B?TjFsMEtYL044MFdoRDdYZDMrRml6WW12cEtFeE8rODNyWUFRZ25hRkVLc0Rx?=
 =?utf-8?B?ZkxGVTAyL3UzQVVNdU1uWi9PMjVsdi8rWnVZendvY0FiWStNbXdTazNPazda?=
 =?utf-8?B?V0dhT3VPYmFuS25XKy9TNU9vTGsybWlMRGdyOEQ0VERXYUU1djJCS2pZQVBJ?=
 =?utf-8?B?THRpRFdTSC84SnNham5ISjdFdVB4TXhHeG1hcWdQZStiOFF5Q2RLRmdOaldU?=
 =?utf-8?B?V3crL2JhR2ZFYmhVbFRzeDRKV3JKNXJ1L1R5SUVxTDA0N2hQU2NoVG9hamhS?=
 =?utf-8?B?VVNkU1pCSGZGeUdZZllFOEtuTytOM0V6V3JWUVZYVkJoTVk1WXducGZSbUJG?=
 =?utf-8?B?cURQdWR2T3lKRjFHU0tUN0dkcEwxUmIxTmxLRUlhTWVrT1dINGwxQUhnazNW?=
 =?utf-8?B?bEtkVmUxUGVQY0pZeHRReVFLZXEyaHRuSzhUMVMzbDhlQld5RTBrNVN2RXdm?=
 =?utf-8?B?dzBTZXVna0R1TXVraEdoNm1IRCtIcTQ5Y2MrZSs0RHhvbVFKeGo0WEltQmVU?=
 =?utf-8?B?d0xZT0VsU3R3bEhEK0Z0U1RCTG15Ym9YRHhEb01HNjB1T0M3V0NlSTFabWdW?=
 =?utf-8?B?TFY0clVYU3JuVXc3MEU3SHF3VFFnTUt1SEdVRnA4bldURUZLbXNIelRTNkI2?=
 =?utf-8?B?SXdsaUh1VHVmTG93SERNNTYvRmFOS2VWNHBBNDNmNjYxdkh2dEgrMGRNa2sv?=
 =?utf-8?B?M1p2YUcyOE5SNDQ2K2tjcXd5anZ1NFBIRnBLeStqdVlYS1FPcWJ3ZUtlWmk4?=
 =?utf-8?B?TEk3c2g1dDc4SkNhUUJBNWE4dWJlaGRmUjZWZnlidFFpemNUSk9MWm0yU0Ja?=
 =?utf-8?B?NTZ4bm5Wdkx2dUY0aDd3NWdoN0NLalZ3V0QwODVoNVczejdKZXROalh4azdy?=
 =?utf-8?B?WjlweS9CbnVTbC9RZVlPTmRwZDFudmNIUzFaTGZMbDQ4VWs1U093VmpHa3lW?=
 =?utf-8?B?b2NlWW1EUHlNL3JON1ozeko4amlYWHN3d1RDOUFUREVIeFB1RWRBMno3bnJK?=
 =?utf-8?B?RHN3clNoRFRJVTB3UWRrNlpldWFMWjVKVGpsVjEzL1BrWFlSTEc4OEFmZE01?=
 =?utf-8?B?ekg1MXpUWnlQdGxoUk0wYkJoVkFjb1M5NXBGcHdjV3hQc3IyZjAzOWUvaDlQ?=
 =?utf-8?B?WmNPNEpPZ08wVUQ2S1hJVEllNTNzYnRzdEp6aVJzVStXemVIQUwzbGovUFVp?=
 =?utf-8?B?cUFhZm1MMzg0OWpacHJaMExjWlRZcXhtL1owdEhwZWV2ZHN5YkFoeHlrSUZR?=
 =?utf-8?B?SGhmdkQyKy9lbi9rZWdPUHhtZzd1SkRGaS9ucnhTR3NhaHdUZjNlSFJHVWpy?=
 =?utf-8?B?ajN1NllrM0k4WTgxc0pQSVU4ejNrMTV5emJtSmZ2MkcyVXVrS2VKbXBXNlFq?=
 =?utf-8?B?ZEd0NTgzYkN0Z1o2c1haT2JEL0tEbnBpUDRBbThLTWkzNmVteWJ3QlVTUWtY?=
 =?utf-8?B?OW9wLzFKTFRFUjRlYkJQazE5bEhQUDE1VDJNVG0xbWZZc0l5dWNtV1A3L0s2?=
 =?utf-8?B?eFZmL0FmcUZTR3NoMGZQQW93L3ZDS2lXUEJSejNOVnkwOFZKOXRoQWhyanZu?=
 =?utf-8?B?aW1oZm5CK3EzRTRreStzZ0Z5ZUhmMXVXeHh5Nk0xcllzQ29JVEt5a2NidEc5?=
 =?utf-8?B?RVNhT2x5cjhIaEl5TVZRZGdrZGI4UGphUXpDYTFwUFFjZ0VycnNDZTN6Szd1?=
 =?utf-8?B?eXlSYUxWR0g0bThSaDdqSzZBbi9uR2c5RGtKdDlSSWN2MTJEelRRMjdNNXNN?=
 =?utf-8?B?ZkxxNG5EdkNlSHBqSXA1cllucW9mU21zbS8wOWVwaFZlVng5K2VUbGRLdUlQ?=
 =?utf-8?B?OXQra1VtRnR1VjRHZ3V0R1dZYzlRPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e287013-6a7a-44f4-bdcd-08d9d74e3bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 11:08:45.9065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VsObQqTdy9vgdR9ncohW821/uULxP96Tt9BYXYRgGFYOu5Ssdk/WeVV5TCqZWY1d20QxDP7vIatO957PM8cV9y3HDXKPDjOexyUH3KKWlPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_030853_232586_061F1997 
X-CRM114-Status: GOOD (  32.46  )
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
> On 14/01/2022 09:29, Biju Das wrote:
> > Hi Neil,
> >
> > + renesas-soc
> >
> >> Subject: Re: dw_hdmi is showing wrong colour after commit
> >> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >> callbacks")
> >>
> >> Hi,
> >>
> >> On 13/01/2022 21:01, Fabio Estevam wrote:
> >>> Hi Biju,
> >>>
> >>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
> >>> <biju.das.jz@bp.renesas.com>
> >> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
> >>>> till the commit
> >>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >> callbacks").
> >>>>
> >>>> After this patch, the screen becomes greenish(may be it is setting
> >>>> it
> >> into YUV format??).
> >>>>
> >>>> By checking the code, previously it used to call get_input_fmt
> >>>> callback
> >> and set colour as RGB24.
> >>>>
> >>>> After this commit, it calls get_output_fmt_callbck and returns 3
> >>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback, I
> >>>> see
> >> the outputformat as YUV16 instead of RGB24.
> >>>>
> >>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
> >>
> >> This patch was introduced to maintain the bridge color format
> >> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it seems
> >> it behaves incorrectly if the first bridge doesn't implement the
> >> negotiation callbacks.
> >>
> >> Let me check the code to see how to fix that.
> >
> > Thanks for the information, I am happy to test the patch/fix.
> >
> > Cheers,
> > Biju
> >
> >>
> >>>
> >>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
> shows:
> >>>
> >>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
> >>> (DWC HDMI 3D TX PHY)
> >>>
> >>> The colors are shown correctly here.
> >>>
> >>
> >> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation
> >> fails and use the RGB fallback input & output format.
> >>
> >> Anyway thanks for testing
> >>
> >> Neil
> 
> Can you test :
> 
> ==><===============================
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..7019acd37716 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
> drm_bridge *bridge,
>         last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state-
> >state,
>                                                             last_bridge);
> 
> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> +       /*
> +        * Only negociate with real values if both end of the bridge chain
> +        * support negociation callbacks, otherwise you can end in a
> situation
> +        * where the selected output format doesn't match with the first
> bridge
> +        * output format.
> +        */
> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
>                 const struct drm_bridge_funcs *funcs = last_bridge->funcs;
> 
>                 /*
> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
> drm_bridge *bridge,
>                 if (!out_bus_fmts)
>                         return -ENOMEM;
> 
> -               if (conn->display_info.num_bus_formats &&
> +               /*
> +                * If first bridge doesn't support negociation, use
> MEDIA_BUS_FMT_FIXED
> +                * as a safe value for the whole bridge chain
> +                */
> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
> +                   conn->display_info.num_bus_formats &&
>                     conn->display_info.bus_formats)
>                         out_bus_fmts[0] = conn-
> >display_info.bus_formats[0];
>                 else
> ==><===============================
> 
> This should exclude your situation where the first bridge doesn't support
> negociation.

I have tested this fix with Linux next-20220114. Still I see colour issue.

It is still negotiating and it is calling get_output_fmt_callbck

[    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=0#########
[    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
[    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=2#########

And In get_input_fmt callback, I See the outputformat as YUV16 instead of RGB24.

[    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16#########
[    3.473644] ########hdmi_video_sample MEDIA_BUS_FMT_UYVY8_1X16#########

Regards,
Biju
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
