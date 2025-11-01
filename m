Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63493CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Nov 2025 02:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9L/UWIAOuPSTWUSiZ1vqZtOHEG967MU9BkB4L2nb6c=; b=VGHLG+S2+xXFYeJgTxgYAN1D/x
	IS5pjMQQBS7PpmYc2CLMxdZORS5QpfnGl8Z9wpN5sfdX5Dz8gSHTX0lnItATaBZ1XYIDxnh6GeawC
	r0CrRFy5ySHTLEyTaWY2Nbn4O67C2AEk/4RS4NLDGICtGHRvmSAnOea4tD5dhQPjNL7PXC/o4uS+l
	nVDcwnbqH0t+9QfQveGGINCv4s3xrHcUk4NxVUYu5/leE9idTUHC9nIcQx3XVSHbjOqBa55IQ8qN7
	LrGDCMyPwqDBAG+Lvu9v28gNu9jqM5Os/ZZva/urVubjT9GOwWkYH6+cq22p8f3V3HYteiTCdkWR8
	ldBQEBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF1IF-00000006zkk-1uaR;
	Sat, 01 Nov 2025 02:24:39 +0000
Received: from mail-northcentralusazolkn19010017.outbound.protection.outlook.com ([52.103.20.17] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF1Hj-00000006zjl-2YLs
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Nov 2025 02:24:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErOkVZdrkiAWjvVNa46uC0lULcYX1BLYFqY+3RZJq2PiodtVY9mPo/IFRwIPMk3aNOAflA2ymT21DrZDbo3n9crJvA9Iwdc3NsjLO8Ws3X4trpWAyMG4P4ijgHLZn8AIyakfWzDOwOd0wk/glkrj1GxY9uDG/8SYlsgBH4WsJ2infMwGrIfXqQx3ZQr/acI++fybGL94H1RX6mvryClaoE7McZvXYEkEptZWyEdZvJbdkOxdyT7yU8cefzCsIpF6lQOKIWKjwCzrHxIOGCAq0Hn/YTt8pgWGklP5TV5j1dg5Kxl9VoGLCu5JL4BGMuhWQ31FB4amo6DaFwvD37lB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exv8EwSIUVThm7FLYeZInjiQ+hhNfe/MlgGRwklS1DU=;
 b=a8qaJfuas1JbArjNxn13nDACFmKAZYVW/fyaZHADyNsNyAuqP+SYtg0jCw2g9N+C8nlAE4KwqCttBNoHLQ6gW0rxbTJVtDQd7TTxDAvSoKoAYpP4tqyBFFk856SQKXf7rsQyxVRVIOkfOCXvLFljGrIiIUpg6xFZY7jkAuS0JOTesfj8W6NFADV+QnW1RaJ+OQjnHHYwIPQwj3hBsTuyJ8A7vL+I/VnqalWJTLV0fQ5dnjt3dbm+hcqXfTzuerove8fcC+Q+Z5mcmS/iZwUDsyHWqUQ1RZj5CeCumPeQSgrtdFS2P2SfaaJFxxN41ZfiTBIs6OTohmJh7A9+2P7Vig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exv8EwSIUVThm7FLYeZInjiQ+hhNfe/MlgGRwklS1DU=;
 b=LTueUBQImT8nF3O5RTQCt9uw5x3LoZwOfZavL8lMyqJrrmajpLA40xex2X/I2KjEYvEtY8IkDCNK1O+5xvPtJy8Kz3QnpaY1MVlJ05PUgP+LDe41UbW4k8SCbhUkg+iZxCeKiaC2seGSDroxivAer2FAgrgX3pSIMX40MBvi4JbYIPwUnDUqid8ejbYaA4fmPP1BWh/lRNynIedXNrT06gPOnuBnJ4x0MNdviftebifZe+2JfBTZaxN5lqJDYTerO4RPIYUGQZmRnJKhoWNWz5M3cL87Rmy9HE+8KFxtK0Jj6iqWBVPXCiSLgQLyCVj+kkzFdYjFmjOx/syFvpQ7Pw==
Received: from DM4PR05MB10270.namprd05.prod.outlook.com (2603:10b6:8:180::11)
 by IA3PR05MB10967.namprd05.prod.outlook.com (2603:10b6:208:508::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 02:24:00 +0000
Received: from DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c]) by DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 02:24:00 +0000
Message-ID: <DM4PR05MB102701671A4743DD0DB3D622AC7F9A@DM4PR05MB10270.namprd05.prod.outlook.com>
Date: Sat, 1 Nov 2025 10:23:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20251031161323.GA1688975@bhelgaas>
Content-Language: en-US
From: Linnaea Lavia <linnaea-von-lavia@live.com>
In-Reply-To: <20251031161323.GA1688975@bhelgaas>
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To DM4PR05MB10270.namprd05.prod.outlook.com
 (2603:10b6:8:180::11)
X-Microsoft-Original-Message-ID: <b1e0c887-34bc-4de6-8bca-25f9e1fa8e41@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB10270:EE_|IA3PR05MB10967:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ec455d-9bfd-4653-791d-08de18edb714
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|461199028|6090799003|5072599009|15080799012|12121999013|8060799015|23021999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlM2cUVKWXdLSVhVRWxXVnlQMGxEZGpJeDhFUkRGVmhEQlRhN0ZteG9MUWJy?=
 =?utf-8?B?ZmtrZ28yMXRReUxvQXVRQm5Mbno3MFhCWEJSZjlHNG1uODNQVVcycXpLOVJP?=
 =?utf-8?B?L29iWDBUU2NUWGxqOUIvV3FsY1JiMUpHNzluakh2emFpL1BqTTgyVDNUUWNl?=
 =?utf-8?B?S2Q5Z0RqT25EMTRwci9ZckF3WjJpNkZmNWRNdVk2YitHeVFuWEFaYlg5cXpt?=
 =?utf-8?B?MVpSSWl6cVVRTGxJVWJmSkdBZk1WVXgyZHRDZDZGOXdpeFZBeEFUNWpoUHZy?=
 =?utf-8?B?TXRUeDN3VURjMFRHdlVsYVU2ckw0REFtbTRlL2NzVEtZekxQUHlVQmhQL01M?=
 =?utf-8?B?ZVg0V1piNU5UWTF0RWl1eDdQd2lvQXR0L3JSZm1Wb1RQTitKaFJOcGlGM2VL?=
 =?utf-8?B?aVpvM3d1RUZ0RktxN3hQYVl6OHc1RktESVFnb3JaNHlJdGwyQUxlL2VMNDBl?=
 =?utf-8?B?RHFEQTdIdmNZcVQwTmExT28wcUkzTi9KRWp0aGdiU1JPMGxYck8xTkNqam9R?=
 =?utf-8?B?NEgrUCtieWtaYVVNUXI1WWdpMkg3RGltUS9ZQ2cvUElFUFNhd0IyelJpaTN2?=
 =?utf-8?B?R3lKSzZaZWtaTjdwNTVQYnlqd1E4MEhoVHk4a1Z2YjlmdGgvRHpNSldTZkJs?=
 =?utf-8?B?QVExbXBlL0V5QkZGbGdVbnhLNk5MRFA4ekg4bklJZ0dxUElyK1ZWWkhuVUdH?=
 =?utf-8?B?TE1lSFBSY2ZYQXhha1N2WDZzalpNU3ZNbEpkaGNPQzNZQlR3blM1VlZpdjRt?=
 =?utf-8?B?SDJRQjZIQjNvODlCQmw4dlFqeTlQaUs4NCtCTjgyLzJQd0ttTFVUOTZFaWxR?=
 =?utf-8?B?M0lxZ1hJTGJWTnpqTVQyTW45Z1VOOXVYUGNRR0t3Vnlqc3Uva3NrUjhoeGcw?=
 =?utf-8?B?cGhMWHZJcFFQMHVTWWtkMFFpWTBGbVVWYm15U1J2SmhMd3ZEWUVmWlhaYlpS?=
 =?utf-8?B?QTRrd0J0cURmMENnYjNkSTdXUDFQZHREb2tINHNLTE1Jallva2p6NFArcitJ?=
 =?utf-8?B?djZXQjlzNWNTWk1LWGcxZCs5LzNjY3ZjRVlRV2l2clc2SzBPYmFxcTZCL0Vp?=
 =?utf-8?B?eFU0dHdna3FQMUNYNG1MV3hHTEpkY3FPV1JqYnZzK0VNdTh1cVBVS25STldt?=
 =?utf-8?B?Y2ZtdnRLdWpPWkJ4OEtSdy9CejgrZmdIV1NtVGdzcWYycFMxWGdnd002SWV6?=
 =?utf-8?B?M2J6ZTRwRGtaMHNjSGVqRXVzUWs3NStrUTNjaytFaGphcCtmMEtIVDBVQ3BL?=
 =?utf-8?B?aldRaWRTeVAwUDY2cTd3ckNScEI4NUxPUTFSTmtNWTRnV001a04wVmo5WG1p?=
 =?utf-8?B?djMwcmRKaHpFaVhqSjFYZ3MyNThyU1dPcGlDbERoWDd2YytlZVdIYXJpTHFi?=
 =?utf-8?B?UWFlQnVrRFU1a2dKM01lTzZqbmdWeEhHbHAvdExnd2RGL25SdnNxTGExWFVH?=
 =?utf-8?B?MHhOQVIwdTJFWWVsRTNiWThUL3ZGTXhhOUlraG8vY0NHdkJ0WjROcCtKZS9s?=
 =?utf-8?B?QWtQZi9IVjlHU0FyVU9CL3NMcEpzMm93L0VRNkl6Nzh1elVBZTIyZEpVQ2hi?=
 =?utf-8?B?U0lQYjZiamQzanRUeTBUYWU3VDk5UlJJLzVOU1Zmb3V0UHVITCs5WmRYNWJq?=
 =?utf-8?B?UmpPTDNoZjBFTVJGbm5ZWmR0OEV0eXc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG9QUDVtalpZc0hKdkxURkp0VW16aUdRNll4Y1B0OStVZUgyWFRXMHEybEM3?=
 =?utf-8?B?dEw2cGNRT3NFOU90Rm56YkZpRGw1QUt2U0F3aGRZWi8rOWNzMjZWamY1TlVL?=
 =?utf-8?B?djJ1UWw3UnJrTWJaOFZtRGZEc3djcFZ4VmM4OVdrV3VXNzduMXpHMEc1WWc2?=
 =?utf-8?B?L3Q4MUtqd3pJNFk0RHpTNGRtZmdIK0I0NVhwOE40WE5PeFZZc1BFZHg5dk0z?=
 =?utf-8?B?WXlDUUtENUZaRm14elRGVXFTRTZqSnlVbE9abUdFbGtrQlh3MFRBK3RkUXRs?=
 =?utf-8?B?K0RuekQ3T2ZDUFI2ZGhSYlJKYk9CdDhXdjlBNUN3bXlqZERvUDhEL3poWGFK?=
 =?utf-8?B?WWgwU3hLUmd5bDluY0dzL01yM2pZcmlvTkZaeFRlaUhDQmUwcHhkazZQakZ3?=
 =?utf-8?B?SUNSU2d1QzZNQURBQVBRaDJZdEZ3d3d4cGNBSHg2bG5qMEVxaWZML1Z5UDN6?=
 =?utf-8?B?Uk5BQ2pSYWxjWmtZOTdBR3pldFFjU292bWUzazVURnVtKzBraDExK2dEVlQ0?=
 =?utf-8?B?ak5XajFXS2hvclhCNjhlOHZHSVhaVXFmSnVraEdFYjdHdFA5cElnSXRLT2M5?=
 =?utf-8?B?OGFkUnBmSkx2TGFyLzAveXg4VEtaZThjTDM0WUtDeWs5bmtNd2pTOE8rcE9a?=
 =?utf-8?B?TjJwTHJxZmdDOTcxQTViYmhlWjgvMVh1dk9URitmVnY4YXkwK25aQlNLYnUr?=
 =?utf-8?B?aVhjc0JZNkNnNWdhakpkUkptTGpqdEtqNVI1TTlxRWlPUnVIRWxPRVBkdGZo?=
 =?utf-8?B?ZWlDb1dVVmJ3b1dJdnM5Mk4wVnduQlR4UVUvU3BSa21SOFN6ZVp6MnhEekFH?=
 =?utf-8?B?NnpHSGluTGVBTzNrYTluK3lseUphT2hsMklveEVTVk9Bb0t5NUVXWk9pM1c5?=
 =?utf-8?B?UFl2eldwNkg5QmZRL3hucGIwK1E1WmpqTzYxUC9VaG1EWDVhRjdObHhvUjgv?=
 =?utf-8?B?UlVKNmc5M0RHVTJBc2dKV2xnd2dxTDhVT0p1MlJhWER1WGVjNzR4blk5bHpj?=
 =?utf-8?B?STl5UTBVbDZaT1E5SXk2MkQxUFpJdWlGR2hyc2J0UXg2UC9KNFNXWTdrZ3da?=
 =?utf-8?B?cEhkL1BYNGZqaFBGNHBpUi9ldXlTNDhKcWJLalNLQlZFMDQ2SmZ4TUFRMHhp?=
 =?utf-8?B?OFNWeHBySkxSZVJwS2o5VlhJelhNeWplZmVveTE2clFJcFpxSWpNSGZ5UmFp?=
 =?utf-8?B?RytoZVZiaUlRcGVnN2NSRndlZWtqNnlLYXZUSlFSTHRUOTRJTlNMZDNKNGpY?=
 =?utf-8?B?dXlab2NhRDdrZkFUemNlT203NkFDcHhVK0hSdGg4KzJscEUrU0V6aDVUQTBt?=
 =?utf-8?B?N29GcWErc0xYVktneEtDNklHRjA0YkZWcTNKdVBGcVRIaWJicnpkRTVPczZo?=
 =?utf-8?B?TUJGMjVxWkNuSUFlSzB2dGZpTDJGcE0wNHlvZkw4QUdOL3MybW5hTGU2d0Zy?=
 =?utf-8?B?SFMrSnIvM0xTbjdJMkp4RWNjcEE1RXZxQ1lvOTdNbXVUNkRjTXJHb3VGbll3?=
 =?utf-8?B?VWw0K2JkZGlkSGpjUnk3NzlYOURFamk0MTZSSFE5aW5YYUl3dkxZSXdDenE4?=
 =?utf-8?B?T0E2Z01nQ2hsMEhRS0VyYXBmRHhUREVmU2lrL1ZaWkhYSEZDVzBCRnV6U3hN?=
 =?utf-8?B?Nk0zUm9qcW1IZjRGWExSWk5zd0lYVHRKbUd5NXB4S0UzNGZmbmdiSUVXOWRW?=
 =?utf-8?Q?ZbWm5ceYxOQcNGRnJsNH?=
X-OriginatorOrg: sct-15-20-8534-9-msonline-outlook-d08a8.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ec455d-9bfd-4653-791d-08de18edb714
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB10270.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 02:23:59.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR05MB10967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_192407_666720_D6528F72 
X-CRM114-Status: GOOD (  38.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTEvMS8yMDI1IDEyOjEzIEFNLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+IE9uIEZyaSwgT2N0
IDMxLCAyMDI1IGF0IDA4OjI2OjQyUE0gKzA4MDAsIExpbm5hZWEgTGF2aWEgd3JvdGU6Cj4+IE9u
IDEwLzMxLzIwMjUgNDo1MCBQTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBPbiAxMC8zMS8y
NSAwNjozNCwgTGlubmFlYSBMYXZpYSB3cm90ZToKPj4+PiBPbiAxMC8zMC8yMDI1IDE6MTUgQU0s
IEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgT2N0IDI5LCAyMDI1IGF0IDA2OjUw
OjQ2UE0gKzA4MDAsIExpbm5hZWEgTGF2aWEgd3JvdGU6Cj4+Pj4+PiBPbiAxMC8yOS8yMDI1IDY6
MTYgQU0sIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPj4+Pj4+PiBpbmRleCAy
MTRlZDA2MGNhMWIuLjljZDEyOTI0YjVjYiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3Bj
aS9xdWlya3MuYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4+Pj4+Pj4gQEAg
LTI1MjQsNiArMjUyNCw3IEBAIHN0YXRpYyB2b2lkIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEo
c3RydWN0IHBjaV9kZXYgKmRldikKPj4+Pj4+PiAgwqDCoMKgICogZGlzYWJsZSBib3RoIEwwcyBh
bmQgTDEgZm9yIG5vdyB0byBiZSBzYWZlLgo+Pj4+Pj4+ICDCoMKgwqAgKi8KPj4+Pj4+PiAgwqDC
oCBERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQQ0lfVkVORE9SX0lEX0FTTUVESUEsIDB4MTA4MCwg
cXVpcmtfZGlzYWJsZV9hc3BtX2wwc19sMSk7Cj4+Pj4+Pj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0ZJ
TkFMKFBDSV9WRU5ET1JfSURfU1lOT1BTWVMsIDB4YWJjZCwgcXVpcmtfZGlzYWJsZV9hc3BtX2ww
c19sMSk7Cj4+Pj4+Pj4gIMKgwqAgLyoKPj4+Pj4+PiAgwqDCoMKgICogU29tZSBQZXJpY29tIFBD
SWUtdG8tUENJIGJyaWRnZXMgaW4gcmV2ZXJzZSBtb2RlIG5lZWQgdGhlIFBDSWUgUmV0cmFpbgo+
Pj4+Pj4KPj4+Pj4+IEkgaGF2ZSBhcHBsaWVkIHRoZSBwYXRjaCBvbiA2LjE4LXJjMyBidXQgaXQn
cyBzdGlsbCB0cnlpbmcgdG8gZW5hYmxlIEFTUE0gZm9yIHNvbWUgcmVhc29ucy4KPj4+Pj4KPj4+
Pj4gU29ycnksIG15IGZhdWx0LCBJIHNob3VsZCBoYXZlIG1hZGUgdGhhdCBmaXh1cCBydW4gZWFy
bGllciwgc28gdGhlCj4+Pj4+IHBhdGNoIHNob3VsZCBiZSB0aGlzIGluc3RlYWQ6Cj4+Pj4+Cj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9xdWlya3MuYyBiL2RyaXZlcnMvcGNpL3F1aXJr
cy5jCj4+Pj4+IGluZGV4IDIxNGVkMDYwY2ExYi4uNGZjMDQwMTVjYTBjIDEwMDY0NAo+Pj4+PiAt
LS0gYS9kcml2ZXJzL3BjaS9xdWlya3MuYwo+Pj4+PiArKysgYi9kcml2ZXJzL3BjaS9xdWlya3Mu
Ywo+Pj4+PiBAQCAtMjUyNCw2ICsyNTI0LDcgQEAgc3RhdGljIHZvaWQgcXVpcmtfZGlzYWJsZV9h
c3BtX2wwc19sMShzdHJ1Y3QgcGNpX2RldiAqZGV2KQo+Pj4+PiAgwqDCoCAqIGRpc2FibGUgYm90
aCBMMHMgYW5kIEwxIGZvciBub3cgdG8gYmUgc2FmZS4KPj4+Pj4gIMKgwqAgKi8KPj4+Pj4gIMKg
IERFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURfQVNNRURJQSwgMHgxMDgwLCBx
dWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKTsKPj4+Pj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0hFQURF
UihQQ0lfVkVORE9SX0lEX1NZTk9QU1lTLCAweGFiY2QsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNf
bDEpOwo+Pj4+Cj4+Pj4gTDEgc3RpbGwgZ290IGVuYWJsZWQKPiAKPiBJcyB0aGF0IGJhc2VkIG9u
IHRoZSBvdXRwdXQgYmVsb3c/Cj4gCj4gICAgWyAgICA1LjQ0NTg1M10gWyAgICAgVDQ4XSBwY2kg
MDAwMDowMDowMC4wOiBEaXNhYmxpbmcgQVNQTSBMMHMvTDEKPiAgICBbICAgIDUuNTYwNDQ4XSBb
ICAgICBUNDhdIHBjaSAwMDAwOjAxOjAwLjA6IEFTUE06IGRlZmF1bHQgc3RhdGVzIEwxCj4gCj4g
SWYgc28sIHRoaXMgZG9lc24ndCBuZWNlc3NhcmlseSBtZWFuIEwxIHdhcyBlbmFibGVkLiAgSXQg
bWVhbnMgdGhlCj4gcXVpcmsgbWFya2VkIHRoZSAwMDowMC4wIFJvb3QgUG9ydCBzbyB3ZSBzaG91
bGRuJ3QgZXZlciBlbmFibGUgTDBzIG9yCj4gTDEsIGFuZCB3aGVuIHdlIGVudW1lcmF0ZWQgMDE6
MDAuMCwgd2Ugc2V0IGl0cyBkZWZhdWx0IEFTUE0gc3RhdGUgdG8KPiBMMS4KPiAKPiBCdXQgSSBk
b24ndCAqdGhpbmsqIEwxIHNob3VsZCBhY3R1YWxseSBiZSBlbmFibGVkIHVubGVzcyB3ZSBjYW4g
ZW5hYmxlCj4gaXQgZm9yIGJvdGggMDA6MDAuMCBhbmQgMDE6MDAuMCwgYW5kIHRoZSBxdWlyayBz
aG91bGQgbWVhbiB0aGF0IHdlCj4gY2FuJ3QgZW5hYmxlIGl0IGZvciAwMDowMC4wLgoKSXQncyBm
cm9tIHRoZSBvdXRwdXQgb2YgbHNwY2kgLXZ2LCBldmVuIHdpdGggdGhlIHBhdGNoIGFwcGxpZWQu
CgogICBMbmtDdGw6IEFTUE0gTDEgRW5hYmxlZDsgUkNCIDY0IGJ5dGVzLCBMbmtEaXNhYmxlLSBD
b21tQ2xrKwogICAgICAgICAgIEV4dFN5bmNoLSBDbG9ja1BNLSBBdXRXaWREaXMtIEJXSW50KyBB
dXRCV0ludCsKCj4gCj4gVGhpcyBtdWRkbGUgb2YgImNhcGFibGUiIChwZXIgTGluayBDYXBhYmls
aXRpZXMpIHZzICJkaXNhYmxlZCIgKGVpdGhlcgo+IHRoZSBMaW5rIENvbnRyb2wgc2hvd3MgZGlz
YWJsZWQsIG9yIHNvZnR3YXJlIHNhaWQgImRvbid0IGV2ZXIgdXNlIEwxIikKPiBpcyBwYXJ0IG9m
IHdoYXQgbWFrZXMgYXNwbS5jIHNvIGNvbmZ1c2luZy4KPiAKPj4+PiBUaGUgY2FyZCB3b3JrcyBq
dXN0IGZpbmUuIEknbSB0aGlua2luZyB0aGUgQVNQTSBpc3N1ZSBpcwo+Pj4+IHByb2JhYmx5IGZy
b20gdGhlIGdsdWUgZHJpdmVyIHJlcG9ydGluZyB0aGUgbGluayB0byBiZSBkb3duIHdoZW4KPj4+
PiBpdCdzIHJlYWxseSBqdXN0IGluIGxvdyBwb3dlciBzdGF0ZS4KPj4+Cj4+PiBZb3UncmUgcHJv
YmFibHkgcmlnaHQsIHRoZSBtZXNvbl9wY2llX2xpbmtfdXAoKSBub3Qgb25seSBjaGVja3MKPj4+
IHRoZSBMVFNTTSBidXQgYWxzbyB0aGUgc3BlZWQsIHdoaWNoIGlzIHByb2JhYmx5IHdyb25nLgo+
Pj4KPj4+IENhbiB5b3UgdHJ5IHJlbW92aW5nIHRoZSB0ZXN0IGZvciBzcGVlZCA/Cj4+Pgo+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzbWxoX3VwICYmIHJkbGhfdXAg
JiYgbHRzc21fdXAgJiYgc3BlZWRfb2theSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoc21saF91cCAmJiByZGxoX3VwICYmIGx0c3NtX3VwKQo+Pj4KPj4+IFRoZSBv
dGhlciBkcml2ZXJzIGp1c3QgY2hlY2tzIHRoZSBsaW5rLCBhbmQgc29tZSBvbmx5IHRoZSBzbWxo
X3VwCj4+PiAmJiByZGxoX3VwLiBTbyB5b3UgY2FuIGFsc28gcHJvYmFibHkgZHJvcCBsdHNzbV91
cCBhc3dlbGwuCj4+Cj4+IEkgY2FuIGNvbmZpcm0gdGhhdCByZW1vdmluZyB0aGUgY2hlY2sgZm9y
IGx0c3NtX3VwIGFuZCBzcGVlZF9va2F5Cj4+IG1hZGUgQVNQTSB3b3JrLgo+IAo+IEkgZG9uJ3Qg
dGhpbmsgbWVzb25fcGNpZV9saW5rX3VwKCkgc2hvdWxkIGhhdmUgdGhlIGxvb3AgaW4gaXQsIHNv
IHRoZQo+IGx0c3NtX3VwIGFuZCBzcGVlZF9va2F5IGNoZWNrcywgdGhlIGxvb3AsIHRoZSBkZWxh
eSwgYW5kIHRoZSB0aW1lb3V0Cj4gbWVzc2FnZSBzaG91bGQgcHJvYmFibHkgYWxsIGJlIHJlbW92
ZWQuICBUaGF0IG1ldGhvZCBpcyBzdXBwb3NlZCB0byBiZQo+IGEgc2ltcGxlIHRydWUvZmFsc2Ug
Y2hlY2ssIGFuZCBhbnkgd2FpdGluZyByZXF1aXJlZCBzaG91bGQgYmUgZG9uZSBpbgo+IGR3X3Bj
aWVfd2FpdF9mb3JfbGluaygpLgo+IAo+IFRoZSBsaW5rIHdhcyBjbGVhcmx5IHVwIHdoZW4gd2Ug
ZGlzY292ZXJlZCAwMTowMC4wLCBzbyB0aGUgIndhaXQKPiBsaW5rdXAgdGltZW91dCIgbWVzc2Fn
ZXMgZnJvbSBtZXNvbl9wY2llX2xpbmtfdXAoKSBhZnRlciB0aGF0IG11c3QgYmUKPiBmcm9tIGR3
X3BjaWVfbGlua191cCgpIGJlaW5nIGNhbGxlZCB2aWEgdGhlIC5tYXBfYnVzKCkgY2FsbCBpbgo+
IHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkKCkgb3IgcGNpX2dlbmVyaWNfY29uZmlnX3dyaXRlKCku
Cj4gCj4gV2hlbiBtZXNvbl9wY2llX2xpbmtfdXAoKSByZXR1cm5zIGZhbHNlIGluIHRob3NlIGNv
bmZpZyBhY2Nlc3NvcnMsCj4gdGhlIGNvbmZpZyBhY2Nlc3NlcyB3aWxsIGZhaWwgKHRoZXkgd29u
J3QgZXZlbiBiZSBhdHRlbXB0ZWQpLCBzbyB3ZSdsbAo+IHNlZSB0aGluZ3MgbGlrZSB0aGlzOgo+
IAo+ICAgIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBlcnJvciB1cGRhdGluZyAoMHhmYzcwMDAw
NCAhPSAweGZmZmZmZmZmKQo+IAo+IGFuZCAiVW5rbm93biBoZWFkZXIgdHlwZSA3ZiIgZnJvbSBs
c3BjaS4KPiAKPiBDYW4geW91IGRyb3AgdGhlIEFTUE0gcXVpcmsgcGF0Y2ggYW5kIGluc3RlYWQg
dHJ5IHRoZQo+IG1lc29uX3BjaWVfbGlua191cCgpIHBhdGNoIGJlbG93IG9uIHRvcCBvZiB2Ni4x
OC1yYzM/Cj4gCgpJIGhhdmUgdGVzdGVkIGFuZCBjYW4gcmVwb3J0IHRoYXQgd2l0aCB0aGUgcGF0
Y2ggQVNQTSB3b3JrcyBvdXQgb2YgdGhlIGJveC4KCj4+IFdlIHN0aWxsIG5lZWQgYSBzb2x1dGlv
biB0byB0aGUgb3JpZ2luYWwgaXNzdWUgdGhhdCdzIHByZXZlbnRpbmcgdGhlCj4+IGNvbnRyb2xs
ZXIgZnJvbSBiZWluZyBpbml0aWFsaXplZC4KPj4KPj4gTXkga2VybmVsIGhhcyB0aGUgZm9sbG93
aW5nIHBhdGNoIGFwcGxpZWQsIGJ1dCBJIHRoaW5rIGl0J3Mgbm90Cj4+IHN1aXRhYmxlIGZvciB1
cHN0cmVhbSBhcyB0aGlzIGNoYW5nZXMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIFBDSWUKPj4g
Y29udHJvbGxlciBvbiBtZXNvbi4KPiAKPiBJIGFzc3VtZSB0aGUgb3JpZ2luYWwgaXNzdWUgaXMg
dGhpczoKPiAKPiAgICBtZXNvbi1wY2llIGZjMDAwMDAwLnBjaWU6IGVycm9yIC1FQlVTWTogY2Fu
J3QgcmVxdWVzdCByZWdpb24gZm9yIHJlc291cmNlIFttZW0gMHhmYzAwMDAwMC0weGZjM2ZmZmZm
XQo+IAo+IGFuZCB5b3UgY29uZmlybWVkIHRoYXQgaXQgd2Fzbid0IGZpeGVkIGJ5IGExOTc4YjY5
MmEzOSAoIlBDSTogZHdjOiBVc2UKPiBjdXN0b20gcGNpX29wcyBmb3Igcm9vdCBidXMgREJJIHZz
IEVDQU0gY29uZmlnIGFjY2VzcyIpLCB3aGljaAo+IGFwcGVhcmVkIGluIHY2LjE4LXJjMz8KPiAK
PiBJZiBpdCdzIHN0aWxsIGJyb2tlbiBpbiB2Ni4xOC1yYzMsIGFuZCB0aGUgZHRzaSBhbmQKPiBt
ZXNvbl9wY2llX2dldF9tZW1zKCkgcGF0Y2ggYmVsb3cgbWFrZXMgaXQgd29yaywgd2UgaGF2ZSBt
b3JlIHdvcmsgdG8KPiBkbywgYW5kIG1heWJlIEtyaXNobmEgaGFzIHNvbWUgaWRlYXMuCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
