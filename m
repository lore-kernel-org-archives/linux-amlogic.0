Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB6FC25B47
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Py1xCk90NzIBFbtpxGJFrjyhAvswtDEYl4BMabNKXu0=; b=Q1LstWrzTgu/DK8/MBOOLrd48F
	2cJ6LvnYunAOIboBMXSDiQcYPpNoGlRdAuGRhytxkkAQYLHVkfW+psFJ+IVw2vy3BVMQ+jVgGySLv
	eyfvHSMRM06rxwK41lp0siuRYxR1UwdTp6+VJ87KM4yFPJpPGWeHP+VzsA7OhV/Gi4pYF0Dx7QxvV
	PSqN1M77C90ju86UMJzJihnrrCC+DSzmWUrRRXYEqyZUM99Vj70VOPKy1NErNMmJj5ejBuI1h9D23
	U7OVGIMOBz3u+ei+VOPcXscL4XeUSnp4lTKTiAbyjlEA1yNYUpFIxGz3e1ND7GKzgFY0OZaqrPLjv
	MYjGfs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJF7-00G2iM-3C;
	Fri, 27 Oct 2023 09:35:02 +0000
Received: from mail-psaapc01on2127.outbound.protection.outlook.com ([40.107.255.127] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJF4-00G2hW-0D;
	Fri, 27 Oct 2023 09:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnTYETFBAq6svaEmfkNyeVFU9GRZ7ciF8qq6JQ8IVcAiOGLxXCTassGDEk7sbf8Jx/oXJfac1pKl7M6ufgOYmIpAaf+VmfS7fvdRx6attzwygft3JTvJNopqABCBc5y+r5EW+pj36vXk/pgMH7vrZLVBRVC74T4bL1rMOExHuNVzBBMxyYYZRIvNC+3cp5i/JWmDxfC4EXq8J87IBe9l69DmHEfaCk6TA7YLAAOkewM7JlU3unssTFMpwem+wXvVb512H5Qv7DJL0Oe028+d8lgWscLtZs/bWcTUW6KRA491rVYffyYeETbVIQLbtciAXP/uYlkfKEDMZclO6c9INw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCKs9fSMXAADhVrAJ0AswCju7ZB7oRtLeG1Ob5ZtrNI=;
 b=dpuHuitGl3/admJ2ggcQeJH4H68yY7i9K/MdGVYo9w8icKSCy+lWn8ID/4atY8wrA6NyZ6nSwy+6wFMdv2vAvuwQkMaTXbsdug/5AO4CFmFWDIZ23qPItn+2r35dfTB7YFT7fXTh1kQtgHmAQKFFKjebeUMEQLwt5m0P5TGuwIuImlvenEnlCe/nWArdBF2fWDJs4BKRavZYP4PwTrynS5ihVgw2a+okTVLyzXtRUMzQrVP3AQ+Ncl+jPFCaoVEu20xQ2tNg7y9Gvj+I76pF+flztMX+S9SULcl/oSwvZBIFjVUOEofGt5g/6kn0eWAOolTsMOzzOqPQDNkhAczidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCKs9fSMXAADhVrAJ0AswCju7ZB7oRtLeG1Ob5ZtrNI=;
 b=QdCTsjsRWk+JLYFz+VZzuMe35UGhPmRYhVaihVtETFbQsG1L3rWbe4OT945BIF1shwuMHu33wyxqG+oJ7cyckgGdU/5Ga5DpAULPZ14FSGGUn27BX430w0VCscVd304z2WmzXcWCwivj3ClmMrgmUpl9OkJlyWKhaDjMk/H8AWSIc5iX9B+CXEqVgWPLF709jBpqV/n7P+2zzQviFaY4F2a8krgnSTCl3A3Uao7KDPjI5rWieUQIEoAQ0PDYWFQsu5qxGxFQ1YSrerzH+e4r2MQF9+Ls6Dp58wtdmpLeFMhedn/YKQBgz8K4J4Kw3+Y90Rh3MtoC03hqrvX2CYRdLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5732.apcprd03.prod.outlook.com (2603:1096:820:70::7)
 by PSAPR03MB5336.apcprd03.prod.outlook.com (2603:1096:301:45::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 09:34:44 +0000
Received: from KL1PR03MB5732.apcprd03.prod.outlook.com
 ([fe80::639:64cb:4cd:d4c1]) by KL1PR03MB5732.apcprd03.prod.outlook.com
 ([fe80::639:64cb:4cd:d4c1%3]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 09:34:44 +0000
Message-ID: <5837e8e7-b7fe-48cb-bd82-c8e3f042e500@amlogic.com>
Date: Fri, 27 Oct 2023 17:34:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
Content-Language: en-GB
To: George Stark <gnstark@salutedevices.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
 <10dcc778-f165-407e-b765-760d277d5e35@salutedevices.com>
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <10dcc778-f165-407e-b765-760d277d5e35@salutedevices.com>
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To KL1PR03MB5732.apcprd03.prod.outlook.com
 (2603:1096:820:70::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5732:EE_|PSAPR03MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: 74abafa0-fe84-4991-1425-08dbd6cff3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFwusN4GmbvG7KZQk49ZXR0FrdTnttz6z4KgVuIdCSgTc/o0U9CjQ4L6H/vpLFKABi87dsQf2FoUZ1446KPXNYqBfJHTxlzvzQWBeJ1LRC2/NMI7Kp5UIWvM7VRaD6V5MqbcLdSWHXXBfuQfX6MhiezyVpGIyRiU6WfW6i68HLN8ip+mqTNxVoDC/HtQ24o7uoLvRnYIQhqUWSYgsr+9s3A+UamJvyCKiPY4mfQxFPiyCW/nHly5/jwm5PERrh1dmQMdZtVDrX4wyLhQkGhUnkC99oziSW42z4KU0QiLgXyOL013RNTZRr70wHTrZg38p0Fnbfns+RDddgcmmIioPURe0hA44hD6+fRQaWGTyQAk5ONjyQEZXp8qzIaW+o33/2T055mESHSEVoqRRDfZxYIF2l0BJ+a6XD7qUQvmeyjMOz8AxPdaOfdeZgP8xkLMBBASgJW1ww3SH1Igkfcyvub4DaliwbY7PN28bu34oW/gaQLcbvZoltshQRy+A5TMcULb/14dm9zaNiYeVclpGcqpGNp8D/6Hh1Iu25sLeZTk4p/2TVgQK11oOGFQcYsZfYAMXeNpmqZMRf4GVDbnRS039sxRPOeSgInWZ5KDug/G6T//DvWvcH+BnOko0kKhZT4R0UNFa90Qiq3pwXZRp6pkeKmjWicVuZY/PNEIg/2LdG76NeATdevEumxNOg79E/BOrO+C5nAIo0UqLQ4ybI8wtfJnSMChGHPgGagd947SkvKl9BhN0mksq9H5qx9G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39850400004)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799009)(478600001)(316002)(66946007)(66556008)(66476007)(921008)(8936002)(8676002)(6486002)(31686004)(966005)(5660300002)(53546011)(6506007)(31696002)(86362001)(6512007)(38100700002)(26005)(6666004)(36756003)(44832011)(41300700001)(83380400001)(2906002)(7416002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlU3RjF6YitGNzhrNk1obVRmRXBTTVFpelhlZW1NWVU0ajdBRU1hT3lRam9Z?=
 =?utf-8?B?cE1nS2ZTNk44M1gxdkZCSkE5bmZhbkx6TWd2S2I0eUVDYWp5ZkM4TGMxY2lD?=
 =?utf-8?B?US9nci9kZ05xVm9xcWZRbzNMaVd3dklYY0tLOFd5NFljRkZOdU1SOFI5ZEZy?=
 =?utf-8?B?VVdkSE9SZ1JHdjB6eVUrSU1PYnNwUTJDdHZWSnd3cXZiMVY2TmwrQSszTXRI?=
 =?utf-8?B?WEZqVUt5NHMrMnpwMURZTWlQU3lFWkhrZWsyK1pVdmxNRSt5SVI0ZG1kdEVP?=
 =?utf-8?B?OTRWd0R3ekJwbnh3c21MbUZLV0dGNXFSN1VESytvQXozUm1DN3BMeWFoTVly?=
 =?utf-8?B?RjlsbUpRNXlhVlRIZVMwQnJyczhRN0dYL1o4ZDQxK2tkOWczckFVMEdwY2pi?=
 =?utf-8?B?QWFnTDgyZ1I5SmJpZzJ4TlhkSjRYS1pYYjIzbU1zQWZsOUhKczNDcTd6Um9z?=
 =?utf-8?B?UkZoZkZNaGg5QnlQYnA5K1dkbjdUNWYxSlF6U1VVdUx6cWExeFVFMjJOSW5z?=
 =?utf-8?B?MEo1bUtFR2tGYXJ0NVowVDFZM2xVZ0dRZGY4ck1jTEJmS0x4UWdJUzJKZGVk?=
 =?utf-8?B?NXdzUCtGSTAvMmNNN25XZXd2VysyRW1EQS95RGQ5MG1qVkJqcTRNNWtkTWJz?=
 =?utf-8?B?em9GY1M2U1NReEJNckozZFBPK3c0Y2x6czBoTTQ1VW1VUktsQVFlRVRadjF2?=
 =?utf-8?B?OU5OSUMwaTluNGxLVTFtdHYxeWh4OE9lNHFhK0h0UjV0REhTKytLTHNFcU5j?=
 =?utf-8?B?cFdBemYyQkc0V0pMbjNQMERzR2ZpcjJ5bHRIM1pEbFVaeEUrOHdQeVNhSUFw?=
 =?utf-8?B?TGptR1lkSDFBQ0RUVUwrK0RFbStvSnB2NDRlVVdZV2dab0trQUFraGpJcVBx?=
 =?utf-8?B?NU1OYUtyZ3pVWTlKdUVLeFRkMTRLNlZrOEwxNU5lUENiQldNbk10NkhsWTRn?=
 =?utf-8?B?S2FqVFZpQ1lPMU9SWVdUc3NEV3JmeG45R09TS1psN0tTb2kvREZENTk2ZnJw?=
 =?utf-8?B?ek9rcWg3aTVKd25VekhCQ2hwZy9TYVRKRnVCMTVzd3ZZVkVxaklndjljc0FR?=
 =?utf-8?B?M2x1RlBFMmRYL3IwMVBsTWhjTGRGOGtEa2R6VG1hdXlHSnhqMkNKVVcrenhW?=
 =?utf-8?B?RWd3Rlh4Nk00SlB4Vm5jUTFSQ2paR2ZSbGpRcmRmZDRVeUlXQkYvQlBFOU5r?=
 =?utf-8?B?TG1KQU16Y1EzeHZ3SStQS3h5Yk1IdGdYQXVWdWxhVGlnQkdEMFMzTXlob3I5?=
 =?utf-8?B?Umx3aWRCbVo1djBkdHd2T2tnQ3FNVW1zVTBtY1NtSW1MTHV3M0poRk9RRXA3?=
 =?utf-8?B?dVJ1ZGRIYXZYRlVLNVkxUWtIT1FYd3k0LytRNTJRNXU5cHYvWm4xem1DZHlL?=
 =?utf-8?B?ckhUWnpCVWRSdHhTcVRuYlNrSEdKMENncGEzZlNhVS8yN0JEUmlISlZwbDdw?=
 =?utf-8?B?ZlFsSmgzdXVOY3JXODRNZ0t3OTBORDVnYVd0c1VKbU54N2tIOGpVYmNkYlgr?=
 =?utf-8?B?ek1JSW1oNE5mWG0rQTRzc25iUHVOcG5LM3pydHBzUVBxZFhiWkF4UGNiTkJm?=
 =?utf-8?B?aTNhQ0tSOXVzVUcwQkxpZS9DanR1UFkybEgxdGVud3V6NXc3RG45TjU4Ynpm?=
 =?utf-8?B?NTNMYkZZdUpCV0hnTW96ZXc5SkZQbFY3RVk0aWRRUDZPL2txVWdoU0J3VHpP?=
 =?utf-8?B?eGp5Z1ZaQnpWZzF5bW9tK2ljcU8yZU5uZG5kQnVCcVRGME5uWVZUd0RhSGdS?=
 =?utf-8?B?SEZiN2s0K2p0S2d5WnBkR3Fjdm1tS2ozV2lOcUlCbENMb3M2Tit5VDdHTHVo?=
 =?utf-8?B?amlHMElueUZvZ2F1eDUvZS9UQzBTVG8rdmtPaVpzZzNlSUVtOWsxdUVISS9N?=
 =?utf-8?B?ZWtHTTJPZmJ1UmE3TlV4ZCtlNjFkcVpTYlZnWUxJNGY1T09CZnNsd01qYVd5?=
 =?utf-8?B?YUlXejZZRkJRRE1qY3ZVV1FOUGN6K1g5TitkZk5ZR2gvTEdDeFVneEJGS2RR?=
 =?utf-8?B?c2J6LzRNS2hVdDB6aEp5Y29jbVFVMThiNEowRXJGQ1hXMHdaR3RLNXdjS2hD?=
 =?utf-8?B?RHcwcmpZNnl4QkpVdjN4eEtyN0Q5ZWxnWWZEd3hBdFhrWjloWlZNWXNjQ3BQ?=
 =?utf-8?Q?KprHVm0hhj2ZADJ2uXdkbZKma?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74abafa0-fe84-4991-1425-08dbd6cff3e2
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 09:34:44.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9bUqcQflvRFJovt5KX/QC88uZV0tHABfiiGSSr6s8JPhTHq1FiGvBngT3RwmojMaPcTkD2Vp/Rsms9maJzl9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_023458_106762_6D7F20C4 
X-CRM114-Status: GOOD (  14.03  )
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

SGkgR2VvcmdlLCB0aGFuayB1IGZvciB5b3VyIHJldmlldy4KSSB3aWxsIGNoYW5nZSBpdC4KCk9u
IDIwMjMvMTAvMjQgNDowNywgR2VvcmdlIFN0YXJrIHdyb3RlOgo+IFvkvaDpgJrluLjkuI3kvJrm
lLbliLDmnaXoh6ogZ25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbSDnmoTnlLXlrZDpgq7ku7bjgILo
r7forr/pl64gCj4gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
77yM5Lul5LqG6Kej6L+Z5LiA54K55Li65LuA5LmI5b6I6YeN6KaBXQo+IAo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+IAo+IEhlbGxvIEp1bllpIFpoYW8KPiAKPiBPbiAxMC8xNi8yMyAwODoyNCwgSnVu
WWkgWmhhbyB3cm90ZToKPj4gRnJvbTogImp1bnlpLnpoYW8iIDxqdW55aS56aGFvQGFtbG9naWMu
Y29tPgo+Pgo+PiBTdXBwb3J0IFBXTSBmb3IgUzQgc29jLgo+PiBOb3cgdGhlIFBXTSBjbG9jayBp
bnB1dCBpcyBkb25lIGluIGluZGVwZW5kZW50IENMS0NUUkwgcmVnaXN0ZXJzLgo+PiBBbmQgbm8g
bW9yZSBpbiB0aGUgUFdNIHJlZ2lzdGVycy4KPj4gUFdNIG5lZWRzIHRvIG9idGFpbiBhbiBleHRl
cm5hbCBjbG9jayBzb3VyY2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IGp1bnlpLnpoYW8gPGp1bnlp
LnpoYW9AYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiBWMiAtPiBWMzoKPj4gUmViYXNlIGFuZCBSZXZp
ZXcgdGhlIGxhdGVzdCB1cHN0cmVhbSBjb2RlIGFnYWluLgo+PiBBZnRlciByZWNvbnN0cnVjdGlv
biwgc3RpY2sgdG8gdGhlIHByZXZpb3VzIGNvZGUgYXMgbXVjaCBhcyBwb3NzaWJsZS4KPj4gwqAg
ZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAxOSArKysrKysrKysrKysrKysrKysrCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+IGluZGV4IDI1NTE5
Y2RkYzJhOS4uZmU5ZmQ3NTc0N2M0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVz
b24uYwo+PiArKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiBAQCAtOTksNiArOTksNyBA
QCBzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgewo+PiDCoCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEg
ewo+PiDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKiBjb25zdCAqcGFyZW50X25hbWVzOwo+PiDCoMKg
wqDCoMKgIHVuc2lnbmVkIGludCBudW1fcGFyZW50czsKPj4gK8KgwqDCoMKgIHVuc2lnbmVkIGlu
dCBleHRlcm5fY2xrOwo+IG1heSBiZSBib29sIGV4dGVybl9jbGs7Cj4+IMKgIH07Cj4+Cj4+IMKg
IHN0cnVjdCBtZXNvbl9wd20gewo+PiBAQCAtMzk2LDYgKzM5NywxMCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1lc29uX3B3bV9kYXRhIAo+PiBwd21fZzEyYV9hb19jZF9kYXRhID0gewo+PiDCoMKg
wqDCoMKgIC5udW1fcGFyZW50cyA9IEFSUkFZX1NJWkUocHdtX2cxMmFfYW9fY2RfcGFyZW50X25h
bWVzKSwKPj4gwqAgfTsKPj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEg
cHdtX3M0X2RhdGEgPSB7Cj4+ICvCoMKgwqDCoCAuZXh0ZXJuX2NsayA9IHRydWUsCj4+ICt9Owo+
PiArCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX3B3bV9tYXRj
aGVzW10gPSB7Cj4+IMKgwqDCoMKgwqAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOGItcHdtIiwKPj4gQEAgLTQyOSw2ICs0MzQsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgCj4+IG1lc29uX3B3bV9tYXRjaGVz
W10gPSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jb21wYXRpYmxlID0gImFtbG9n
aWMsbWVzb24tZzEyYS1hby1wd20tY2QiLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
ZGF0YSA9ICZwd21fZzEyYV9hb19jZF9kYXRhCj4+IMKgwqDCoMKgwqAgfSwKPj4gK8KgwqDCoMKg
IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0
LXB3bSIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmRhdGEgPSAmcHdtX3M0X2RhdGEs
Cj4+ICvCoMKgwqDCoCB9LAo+PiDCoMKgwqDCoMKgIHt9LAo+PiDCoCB9Owo+PiDCoCBNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBtZXNvbl9wd21fbWF0Y2hlcyk7Cj4+IEBAIC00NTEsNiArNDYwLDE2
IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IAo+PiBtZXNvbl9w
d20gKm1lc29uKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrX3BhcmVu
dF9kYXRhIGRpdl9wYXJlbnQgPSB7fSwgZ2F0ZV9wYXJlbnQgPSB7fTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9Owo+Pgo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChtZXNvbi0+ZGF0YS0+ZXh0ZXJuX2Nsaykgewo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnByaW50ZihuYW1lLCBz
aXplb2YobmFtZSksICJjbGtpbiV1IiwgaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNoYW5uZWwtPmNsayA9IGRldm1fY2xrX2dldChkZXYsIG5hbWUpOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGNo
YW5uZWwtPmNsaykpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIobWVzb24tPmNoaXAuZGV2LCAiY2FuJ3QgZ2V0IAo+
PiBkZXZpY2UgY2xvY2tcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoY2hhbm5lbC0+Y2xrKTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc25wcmlu
dGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiJXMjbXV4JXUiLCBkZXZfbmFtZShkZXYpLCBpKTsKPj4K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5pdC5uYW1lID0gbmFtZTsKPj4KPj4gYmFz
ZS1jb21taXQ6IDRkMmM2NDZhYzA3Y2Y0YTM1ZWYxYzRhOTM1YTFhNGZkNmM2YjFhMzYKPiAKPiAt
LSAKPiBCZXN0IHJlZ2FyZHMKPiBHZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
