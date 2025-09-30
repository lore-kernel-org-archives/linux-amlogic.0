Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81495CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Sep 2025 02:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cM1DIb53m7GmOC+8O1q3NbO9SyYlGrgbXGOOrd7BHCM=; b=NxAozd60T31MCBCPB7AqOE7/hA
	RqcJK1ScoOUIeQXp1+ByRVbPgAwTrB7SUxNhU1OQQkAEdkJU4zqV6K/7w3y8NE9yz9pBZZOybbLW9
	TPbrVDkn7ye5Zv+m8zgi/1GvnZP+HBvw0MhgMUtYn5YPXJU2hxUW+0XMq/oVplhSQUcXggggDMYB/
	NsWgHfzZIDQ8bb4pLWn5DQBH6O3PnmEwTdLBP1vvjHDP0dOEuC9eaOPPh6EgC/afTQrRWzRG0Ge4I
	rLmltbjRQPpuTeNvMjKJG8vO5Be4spPsRiAwp197+ifsgBlSHBFpeP4tWbpY0AaUYohXzmN1RPfGG
	giP+ZbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PkR-00000003r7J-0zZL;
	Tue, 30 Sep 2025 02:05:47 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PkN-00000003r54-3GOX;
	Tue, 30 Sep 2025 02:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjmtgmBCVF/rtjkzh7vPX+HhM7Q3X9X/BSHeHlCbUcNnKhsKNBt7AUTtCnVkWHmCgL1DRjMwh8DykZ+S1qiq/P0sFosGYZSNSzuquasOH9zZwYKqwkUu7fipMKTwhUQEhETr9lfd8sFNnt4NEjFvCKDV+29vP55cbIVKDo2uQ0w7Ie+9XMzRQpWCkE63fTvw+tHRDd/DsQoNN1gXkMO0Y1aSWgDbMTJz3d66j+soMhGK/6KMswn9HShkNQp6arfv9l5yZdw7rP5B8ZQwAa+J0LuRcI1MrRWCMkh3QLmc6AZB9oISJhTEvM5u+p9TA8XRlxSCh6PX576W5bbxdzY0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71JOEv/Db94sl02aDS2Ms3EvhNizH/iYcFxKQSOQwp0=;
 b=YHsKT3g9l4snF7HvgcTVg27yeLga879nBCl0FNbwNTglm40Ea5FmOXn9YN7mIdDfMvjEM5U8JU5oGCUY66coTDsF5nX+V/HfHT0YCjsb3SWNkC6RiHYIHQn3H5wHslYQ5EquK3rIRkZUMM+FNITRGmRDUzIY9TA6YtaeZE3+0J6iUIRelSZ0MglwKYwDVsMqmjvC62GmfkRcweUOcGekQLWfLz0fUQ2qXGW6ViLuenuo/92x2hs2TyLfxJYUFxm6WNLlw4edA+t/wXSVlnQB3UCgzDxO3RlHPuYpaZefk3CGlsbOTI4KRjdromW1ioW4VJibzW3ZP6nZVJ3VVBsBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71JOEv/Db94sl02aDS2Ms3EvhNizH/iYcFxKQSOQwp0=;
 b=WsBC8zPKfAKEY6knntKanfw0EAZFS8gk/gLPXI/8dFdcvJU+3B2/RQbuFBoAaNAFnb6G28ZqnjnlWEtfZxfXi7UHOiuxDTwwEHicGkp8GjGlEnMfjnzMDcuGB5q2X4BPjjZULnAHBjoFkozQQYxCABvr/gmJVlBp1nFv9BAjf2y7PuVIUZK23YCWhsECr+b6Xzkfwf2Yk1V+IBPAqYeg+YuY89hZCQSFlW+R0tldE83qPvvDVzoyew8/PtB287RoXGjHGL4SdT2cnN5JizpG/fpzox17mkvErNK+hckS2feSU2xh/BLUhOS978JH0lV37qzRWjUFkZnP3pghr5d5uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8741.apcprd03.prod.outlook.com (2603:1096:101:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Tue, 30 Sep
 2025 02:05:23 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 02:05:22 +0000
Message-ID: <1639bb9d-9cb7-409f-bbf8-bfe4a5d1b8bc@amlogic.com>
Date: Tue, 30 Sep 2025 10:04:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
 <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
 <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
 <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
 <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
 <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
 <1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
 <36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com>
 <1j1pnp5sg7.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j1pnp5sg7.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: b2951d75-3e25-48bc-e9f3-08ddffc5d04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVFDQ1hQWlJYaGVITWVuZUxSTW9ISTM0MGxWM0dlNEhjci9FcnNTZm5sTW5x?=
 =?utf-8?B?bUR4alNjV0FLbDVHODhDbWwycVA0TWdEUTEzV1BGVmhSQXNqc2ZmTGdvbTRu?=
 =?utf-8?B?eVV5RmJZenQyZlhNUlkvTHZzUXdvZlZmZzlDREIzbmVuZUxOek1sRmZFM3hl?=
 =?utf-8?B?ME5QblJONVlnYjhjbWwwYlV6cFhjSDJhNmRaLzhxTHR3U25PNVZVVHpWSWI1?=
 =?utf-8?B?S25KYnl3N0tVZHJVRWFnMkw0akhUVlc2ZmRrTlkvMnRXS2dHVnFjSklENXdC?=
 =?utf-8?B?ZndlYjFwWDhvM1lVQkQxckFBc1V1NVhtM1BkUzdYU2xKNi9ZRlJvMDdHTDUx?=
 =?utf-8?B?OFpaeTFCQUdkQWRObjBLbzRydXM0THpaMTNHQ3M0bG9wT2lLdmRBTFk2MjNp?=
 =?utf-8?B?R01SYlVZMlB5aWFmYzNEeDk1YmtRMFU1eUV5YVFrc0lRdCs0N0U4dStWWXRZ?=
 =?utf-8?B?YnpJeCsyNU5tSi9IUVNCOTRpSG82bGwzVEcyM1d0VlVtVmdacWExelh5NHg3?=
 =?utf-8?B?RmdkR3E1QTJhOWswcXZZUVJUVmJGYUZBTFU5U1VPWTFNRVV3L3RRSVcrS2V0?=
 =?utf-8?B?ZDRUVXBwV2UrL1BSdDRrK0hXRER6Wk91SlBmRVRjWDBqLzBlekhlN2dRdkJJ?=
 =?utf-8?B?RVJ4Vkp2Vkd6Qk9uanEwRER5RzRnOXVGY0NKVmhncGV0bW5JYWdKK2hIcnRo?=
 =?utf-8?B?WmZKa1dRZXpwQUp0bE9pbGFhM1pKYlYvaDdvWThqdCsvdCtLUEhFTjZTTTRG?=
 =?utf-8?B?ZFZ5cmRYQTRNQkhoUCtTSzdJOGFrSk5hekxRZG4wOTJhcjR1dkIwVkR6VWpm?=
 =?utf-8?B?cEgrcDRpbWorMm1haXlrYVp1SVVzUit5VlZOMWRiTnBEa3lBOFF5Tkd4cWE2?=
 =?utf-8?B?b3pIbGtaays5Q2FTaFJCQjJweGlWSFVodWpPZEpTOUNVb0RZODlFVHVHUVQw?=
 =?utf-8?B?VXNzbFlocDMxYVJjZitXMjMxdzAzbVRzRnRidC9YVGI5WGpmL1hCUGdoN3BF?=
 =?utf-8?B?OTNVbUorWWFOZmY3UFRBR0JqbEtnU000Z3pNckJ1cmVJdG5HQ01aK1BEeE5W?=
 =?utf-8?B?RzEwNDBkUmQwRHBLdWNxRVdsL0g2R2psT2UxWmxlTTgyWTZYUXJQRm9hYnBr?=
 =?utf-8?B?bUxlSzBWUldlM1Z6eVVtd0R1MXZkYzNSRE5YblNmaDJPZlpHamRONno1cWcz?=
 =?utf-8?B?bTc5SU0vaUVoZ2hhNDRDL1dWZEw1YWJUM2lvY2RMWk1sUWtXMTBVeHFncUJ4?=
 =?utf-8?B?SkplSVhTQUdERCtRV2NyK3VOK21FeENkYWh0SjVJWUJSR2VCT0xnRWY5ZU9x?=
 =?utf-8?B?MGJRZWlnOGVEVU10ZkdkeVRUTUZpYjhwQjFaV21BbGpTTDFyZkw3TVJBWTRr?=
 =?utf-8?B?SGdHZFptcUJGVUNNeDJjQWVJdGNRemUxSFBQS3orQW5LajVremRVUndIbmFz?=
 =?utf-8?B?aVZRMDVNQmZHaDA4cHY4TlhtK2xTVWlwVFk2MEpSVDh5WkFXenhTL2FQb3ov?=
 =?utf-8?B?VGxBeVpDeHBIK1VqVFdPQ01MVHlHNmREMkx6NVQvKzg3UUp5ZU5GN2RTdDZa?=
 =?utf-8?B?ZmxTa091S0I1M09Da1drc1Y3R2ZTYldVbm1FQ2VDbVVpSitRYm1jT3ZMaVpH?=
 =?utf-8?B?WmhCamN6Y05HL2hyS2c2TmhGM0wxNHA2YWh4cTNOV1MzR3hObWQxL2Vqd25O?=
 =?utf-8?B?NjJiWjFSaWVPLzU5dDVwM1ByWjlKdytKeFB0RFFEZXB5UWJCY0JNd09xUWtL?=
 =?utf-8?B?K1JWcVRYeGdGU01xYm9aejZLT1dIeDViQ0lhQWl3bmR0VzVPcnI5dnV3bmFv?=
 =?utf-8?B?dDFKeU91OHd4b3FpMkZwL3lwOHJSekRQcmd0OVhMdlhYVS93RU03QVY1bXA4?=
 =?utf-8?B?cEE4ZXRDKzB1NmYrajlVRGhLaEo3VDc1RTRPWmpqcWNjaTFWSXRobHdUa0NN?=
 =?utf-8?Q?Lq6BASgesqfT4vIrMSDQTAXgmC7NQGyt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNnV2g3dmhJYjlaLytUWnc0Wk16NFN0OUF3YlFsbFNrMHZzNFM4anR1dmRE?=
 =?utf-8?B?V2FMcjJMMms1NlNMeU4zUjEwWnhmMCt0eW9JWmlyWTA1Nlk0TkY4OUdjMnRJ?=
 =?utf-8?B?bmUvZGhDTDZCK3hCakRvTmpSQWQ4Z2QrUFNVOW9IQWZwRnJQbkZGOCtiUkoy?=
 =?utf-8?B?SEtpdGRzU3luQU9BWFU0Qzk3RmdESGRhRFBFZWNicXcwcTd3YUFsTFd1NE0w?=
 =?utf-8?B?dVFTdG93Rm5QS0liaWxvZGhzZ2gzbnBXa2Y1bytLS1BKMkRpQjUyclVHM1F6?=
 =?utf-8?B?LzNScXFYcDAyQTl5TGRtcXR0UzN2eTgrcGRoUTVkU0Zjb1FCYkJOQVkyNTlF?=
 =?utf-8?B?TkNWcEFtVnMzUVVpekFYZkd1WHBIVEpUQ0dEOVpEZkxTRVVFTGpmZGdUVkE2?=
 =?utf-8?B?ZXNJc05STE5vaXJQTjFOeFIrcE5CbHh5TnhaRHdCUmwySXMxRWN2NFFVeGxp?=
 =?utf-8?B?OVRTeWorZ1cvWUdrd2FSZSt3YkZEZUgvcUtWcmcycERWV2h0UmpUUkxVZGRo?=
 =?utf-8?B?amdGSUs1dTFTWmt6T2ZTaHlkTXFJL1BaWnRJbXZ5SzVHT0FrSTNsVjdJcENU?=
 =?utf-8?B?dVJrbE9NMk4zY0dDUDBKcmNQYlhhZ1dQQnM2VWU1SjFPNk1qaWhsVlRtbDd1?=
 =?utf-8?B?Zk1QWEZQQmc1UU53RnZ5NDUwbENPcHgzSVVGVlB3Mmd5bXE5SzBsZlZQNG5W?=
 =?utf-8?B?c1hBbmNkUjRneU1HOTM4cjc0MWxYNTQ4bDFEUXU5NmcvSVYzRVJjazQ2NXpt?=
 =?utf-8?B?MHY0OElXTUJxWUxPQ2d4cjNiTFpzaklTcS9EcVhKRnVSVFVkVlZlVXBpZHZO?=
 =?utf-8?B?cUF1RGhnY01ERlNGaUNoWVM5ZWhncnI5OUVnSThnYmdYU0U5TmhEMFpjUTI2?=
 =?utf-8?B?ZmZVVTY3MHB1Qnhjc1FuZ21JZ1NWTys5WStHMi9hdjArSmpzZWR3Mm5UNStM?=
 =?utf-8?B?VEQvY1g1cnRHNHV4NDk5N3ErdmdPWTlPYzJtZmoyNnNVQWdxektLS3RSR1NO?=
 =?utf-8?B?NFhmSi9uVGRXT3VFK3Zya1RJdG9nL1dVUDRzbkk5QUJLbEs4SDRoTDlxQUJa?=
 =?utf-8?B?OWVaZ09HMldEU2N0dVNWZ2FDejVpNnNpWld5T2RDeFJqTlIza2pPdE9XcDBk?=
 =?utf-8?B?UFVaRFhqUjZocjdEYTFFYUZVcmJFZnJ5L20xZXVVZE0xTHpZZ01KRGswT1da?=
 =?utf-8?B?OXRzNUhMZHZOSm9YYzR0OGc1c2ltdTlqVXdqMzFIMURxZHc1Rzl4K2RFcm5Y?=
 =?utf-8?B?SnhjSXk1SmtMMDdoK1czY1h3QVpITEZsTmRwT3drRGlCZ2dvYldwN3gxWHR6?=
 =?utf-8?B?RTRnejA3M0x0OG9TbWlTWXhCZ3hZekdhKzRjMmZkUlQvQjEzbFZNclhmNENL?=
 =?utf-8?B?czJaemhuMVBVZnEvckNpSzl2TWtEWk1BbjNMSGNUZTBaSlQ0OVNpWlVORUlk?=
 =?utf-8?B?ellyaFQyZ2tPL1crODJ2V1V3S3R6VWtteWFVdVlOUXdLQkZQTUxNSHplK1dh?=
 =?utf-8?B?TjBmS2lXTFpMREJTeVJpSDhVbm9WdDJRMUpXWW1YSFJEbSsyVlVNcE1HcTdu?=
 =?utf-8?B?eDEvRTdwZ1AyZjBuY0k5enlGK2E2cEJxM1ExdjJTM3k2QkZzTVFwWFlOd3Zn?=
 =?utf-8?B?dU50cTJidUsrUEtKalR3cHBHRHFIWENyU3BVSUdMUmltbkhYMWFRNno2UzhI?=
 =?utf-8?B?ZTNYUVAvUmx3Skx5Mlpwa21VV3oxQUVjT3FlOGtvVXhqdU1hZXI2MDRHS0pT?=
 =?utf-8?B?M2lHOHRVVTNJK21HQ0pRUmJ1WUcyZjJJLzdzMzBYZ0N0ZFAxM1o4RXZCdnRF?=
 =?utf-8?B?Y2hEZ3N2Y096QlJsWEVUdVQyNENKZHJoTk1ESEEvdHo2RHJ2YzJOUDJHcmxW?=
 =?utf-8?B?QzZXS1diK0tzenhUdzhZelRDTzFicW9oWFFjV1IzTk9HaW1iWDE3Q09DMk4w?=
 =?utf-8?B?bEFyRm16UnVhcklrUTJSWGZQSHlnOGtnMjhtK3RMcTJYdGorbFNVU3p6WFlq?=
 =?utf-8?B?UlBlNzBkK0xCc04xajJtYXNkTHBsM01Da2xvWTAwMXdGSzZZd3V1VFVpQjFx?=
 =?utf-8?B?a0Z6eUk5MytSWndCMHhuZkN3UmRvMGlLS1g2VzZaazFIYVRZOGs3VFdOK1N4?=
 =?utf-8?Q?2fV2vF+mNU5vWY1Y3BxYua6Ll?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2951d75-3e25-48bc-e9f3-08ddffc5d04b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 02:05:22.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faLErKVuaasSrWW5qnoAcGClOi6shPLMsjSQrwscgy+twaULaxJnDV2Hxz9xlFYsnYUqMa+4CeqOo1C6ZEHQ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_190543_928410_208D2692 
X-CRM114-Status: GOOD (  28.00  )
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

SGkgSmVyb21lLAoKCk9uIDkvMjkvMjAyNSA4OjU1IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gTW9uIDI5IFNlcCAyMDI1IGF0IDE3OjMxLCBDaHVh
biBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4gT24gOS8yOS8yMDI1IDQ6
NDggUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+
PiBPbiBTdW4gMjggU2VwIDIwMjUgYXQgMjI6NTUsIE1hcnRpbiBCbHVtZW5zdGluZ2wKPj4+IDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPj4+Cj4+Pj4gSGVsbG8s
Cj4+Pj4KPj4+PiBPbiBTdW4sIFNlcCAyOCwgMjAyNSBhdCA4OjQx4oCvQU0gQ2h1YW4gTGl1IDxj
aHVhbi5saXVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+PiBPbiA5LzI4LzIwMjUgMjowNSBQTSwg
Q2h1YW4gTGl1IHdyb3RlOgo+Pj4+Pj4gSGkgSmVyb21lICYgTWFydGluOgo+Pj4+Pj4KPj4+Pj4+
IFNvcnJ5IGZvciB0aGUgaW1wcmVjaXNlIGRlc2NyaXB0aW9uIG9mIHRoZSBnbGl0Y2gtZnJlZSBt
dXggZWFybGllci4KPj4+Pj4+Cj4+Pj4+PiBSZWNlbnRseSwgd2hpbGUgdHJvdWJsZXNob290aW5n
IGEgQ1BVIGhhbmcgaXNzdWUgY2F1c2VkIGJ5IGdsaXRjaGVzLAo+Pj4+Pj4gSSByZWFsaXplZCB0
aGVyZSB3YXMgYSBkaXNjcmVwYW5jeSBmcm9tIG91ciBwcmV2aW91cyB1bmRlcnN0YW5kaW5nLAo+
Pj4+Pj4gc28gSSdkIGxpa2UgdG8gY2xhcmlmeSBpdCBoZXJlLgo+Pj4+IFsuLi5dCj4+Pj4+IEFu
IGV4YW1wbGUgb2YgdGhlIGNsb2NrIHdhdmVmb3JtIGlzIHNob3duIGJlbG93Ogo+Pj4+Pgo+Pj4+
Pgo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAxICAgICAgICAgICAgICAgICAgMgo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICB2ICAgICAgICAgICAgICAgICAgdgo+Pj4+PiAgICAgICAgICAg
X18gICAgX18gICAgX18gICAgX18gICAgX18gICAgX18gICAgX18gICAgX18KPj4+Pj4gb3JpOiAg
4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/i
hpEgIHxfX+KGkQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBeCj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgIDEgKiBjeWNsZSBvcmlnaW5hbCBjaGFubmVsLgo+Pj4+PiAgICAgICAgICAgXyAg
IF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfCj4+Pj4+IG5ldzogIOKG
kSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8
X+KGkSB8X+KGkSB8X+KGkQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA1
ICogY3ljbGVzIG5ldyBjaGFubmVsLgo+Pj4+PiAgICAgICAgICAgX18gICAgX18gICAgICAgICAg
ICAgICAgICAgICAgICBfICAgXyAgIF8gICBfCj4+Pj4+IG91dDogIOKGkSAgfF9f4oaRICB8X19f
X19fX19fX19fX19fX19fX19fX+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkQo+Pj4+PiAgICAg
ICAgICAgICAgICAgXiAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4+Pj4gICAgICAgICAgICAg
ICAgIHN0YXJ0IHN3aXRjaGluZyBtdXguICAgICBzd2l0Y2ggdG8gbmV3IGNoYW5uZWwuCj4+PiBP
ayAuLi4gYnV0IHdoZW4gaXMgaXQgc2FmZSB0byBkaXNhYmxlIHRoZSAib3JpIiBjbG9jayA/Cj4+
PiBDYW4geW91IGRvIGl0IGF0ICcxJyBhbHJlYWR5ID8gb3IgZG8geW91IGhhdmUgdG8gd2FpdCBm
b3IgJzInID8KPj4KPj4gSXQgc2hvdWxkIHdhaXQgZm9yICIyIiwgYmVjYXVzZSB0aGVyZSBpcyBh
IHN0YXRlIG1hY2hpbmUgaW4gdGhlCj4+IGdsaXRjaC1mcmVlIG11eCwgdGhpcyBzdGF0ZSBtYWNo
aW5lIGlzIGRyaXZlbiBieSB0aGUgd29ya2luZyBjbG9jawo+PiBwcm92aWRlZCBieSBpdHMgY2hh
bm5lbCAwLgo+IFRoZW4gSSBkb24ndCB0aGluayB0aGUgMiBmbGFncyBhcmUgZW5vdWdoIHRvIG1h
a2UgaXQgc2FmZQo+Cj4gTm90aGluZyBndWFyYW50ZWVzIHRoYXQgQ0NGIHdpbGwgd2FpdCBmb3Ig
dGhvc2UgNSBjeWNsZXMgdG8gdHVybiBvZmYKPiB0aGUgY2xvY2sgbm90ZWQgJ29yaScgYWJvdmUu
Cj4KPiBJIHRoaW5rIHlvdSBuZWVkIG5ldyBzcGVjaWZpYyBvcHMgZm9yIHRoaXMgbXV4Cj4KPiBT
b21ldGhpbmcgdGhhdCB3b3VsZAo+ICogcHJvdGVjdCBib3RoIHBhcmVudHMgYmVmb3JlIGNoYW5n
aW5nIHRoZSBtdXgKPiAqIGRvIHRoZSBhY3R1YWwgY2hhbmdlCj4gKiB3YWl0IGZvciBpdCB0byBz
ZXR0bGUKPiAqIHJlbW92ZSB0aGUgcHJvdGVjdGlvbgoKCkdvdCBpdCwgdGhhbmtzIGZvciB5b3Vy
IHN1Z2dlc3Rpb24uIEkgd2lsbCB0cnkgdG8gYWRkcmVzcyBpdCBpbiB0aGlzIHdheQptb3Zpbmcg
Zm9yd2FyZCwgYnV0IGl0IG1heSB0YWtlIHNvbWUgdGltZSwgYXMgSSdtIGN1cnJlbnRseSB3b3Jr
aW5nIG9uCnRoZSBicmluZy11cCBvZiBhIG5ldyBTb0MuCgpCeSB0aGUgd2F5LCBPbiB0aGUgbmV3
IFNvQywgd2UgaGF2ZSBzdGFuZGFyZGl6ZWQgdGhlIGNsb2NrIHRyZWUgYW5kIFBMTApkZXNpZ24g
YXQgdGhlIGNoaXAgbGV2ZWwuIEFzIGEgcmVzdWx0LCBmdXR1cmUgZHJpdmVycyB3b24ndCBuZWVk
IHRvCmluY2x1ZGUgYSBsYXJnZSBhbW91bnQgb2YgcmVkdW5kYW50IHJlZ2lzdGVyIGJpdCBkZWZp
bml0aW9ucy4gVGhpcwpzaG91bGQgYWxzbyBoZWxwIGltcHJvdmUgdGhlIGdlbmVyYWxpdHksIG1l
bW9yeSBmb290cHJpbnQsIGFuZApwZXJmb3JtYW5jZSBvZiBvdXIgZHJpdmVycy4KCgo+Pgo+Pj4+
IFRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIHJlcG9ydCEKPj4+PiBUaGlzIGlzIGluZGVlZCBw
cm9ibGVtYXRpYyBiZWhhdmlvci4gSSBndWVzcyB0aGUgcmVzdWx0IGlzIHNvbWV3aGF0Cj4+Pj4g
cmFuZG9tOiBkZXBlbmRpbmcgb24gbG9hZCAocG93ZXIgZHJhdyksIHNpbGljb24gbG90dGVyeSAo
cXVhbGl0eSksCj4+Pj4gdGVtcGVyYXR1cmUsIHZvbHRhZ2Ugc3VwcGx5LCAuLi4gLSBvbmUgbWF5
IG9yIG1heSBub3Qgc2VlIGNyYXNoZXMKPj4+PiBjYXVzZWQgYnkgdGhpcy4KPj4+Pgo+Pj4+IEJh
c2VkIG9uIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIG9uIHRoaXMgdG9waWMsIG15IHN1Z2dlc3Rp
b24gaXMgdG8KPj4+PiBzcGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2g6Cj4+Pj4gLSBvbmUgdG8gYWRk
IENMS19TRVRfUkFURV9HQVRFIHdoZXJlIG5lZWRlZCAoSSB0aGluayB0aGUgbWVzb244Yi5jCj4+
Pj4gZHJpdmVyIGFscmVhZHkgaGFzIHRoaXMgd2hlcmUgbmVlZGVkKSB0byBhY3R1YWxseSBlbmFi
bGUgdGhlCj4+Pj4gZ2xpdGNoLWZyZWUgbXV4IGJlaGF2aW9yCj4+Pj4gLSBhbm90aGVyIG9uZSB3
aXRoIHRoZSBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgY2hhbmdlIChtZXNvbjhiLmMgd291bGQKPj4+
PiBhbHNvIG5lZWQgdG8gYmUgdXBkYXRlZCkgdG8gcHJldmVudCB0aGUgZ2xpdGNoLWZyZWUgbXV4
IGZyb20KPj4+PiB0ZW1wb3JhcmlseSBvdXRwdXR0aW5nIGFuIGVsZWN0cmljYWwgbG93IHNpZ25h
bC4gSmVyb21lIGFsc28gYXNrZWQgdG8KPj4+PiBkb2N1bWVudCB0aGUgYmVoYXZpb3Igc28gd2Ug
ZG9uJ3QgZm9yZ2V0IHdoeSB3ZSBzZXQgdGhpcyBmbGFnCj4+PiBZZXMgcGxlYXNlIHNwbGl0IHRo
ZSBjaGFuZ2VzIGFuZCB2aXNpdCBhbGwgdGhlIGNvbnRyb2xsZXJzIHNoaXBwaW5nIHRoaXMKPj4+
IHR5cGUgb2YgbXV4ZXMuCj4+Pgo+Pj4+IEJvdGggcGF0Y2hlcyBzaG91bGQgZ2V0IHRoZSBwcm9w
ZXIgIkZpeGVzIiB0YWdzLgo+Pj4gLi4uIGFuZCBwcm9wZXIgZml4ZXMgdGFnIG1heWJlIGRpZmZl
cmVudCBkZXBlbmRpbmcgb24gdGhlIGNvbnRyb2xsZXIgc28KPj4+IHRoZXJlIG1pZ2h0IG1vcmUg
dGhhdCBqdXN0IDIgY2hhbmdlcy4KPj4+Cj4+Pj4gSSB0aGluayBpdCB3b3VsZCBhbHNvIGJlIGdy
ZWF0IGlmIHlvdSBjb3VsZCBpbmNsdWRlIHRoZSB3YXZlZm9ybQo+Pj4+IGV4YW1wbGUgaW4gYXQg
bGVhc3QgdGhlIGNvbW1pdCBtZXNzYWdlIGFzIGl0IGhlbHBzIHVuZGVyc3RhbmQgdGhlCj4+Pj4g
cHJvYmxlbS4KPj4+Pgo+Pj4+IExldCdzIGFsc28gZ2l2ZSBKZXJvbWUgc29tZSB0aW1lIHRvIGNv
bW1lbnQgYmVmb3JlIHlvdSBzZW5kIHBhdGNoZXMuCj4+Pj4KPj4+Pgo+Pj4+IEJlc3QgcmVnYXJk
cywKPj4+PiBNYXJ0aW4KPj4+IC0tCj4+PiBKZXJvbWUKPiAtLQo+IEplcm9tZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
