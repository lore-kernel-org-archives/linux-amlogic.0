Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C255BCCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 11:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6JgA9jVPPPTTAuXsWn+aqG/NcBC5pu5cGRRScgYsRE=; b=0gKNslfHvn/Py/E+LELJ+uNIoa
	KYZ2SLa6zod8TtAS0xdzIQ4JHMWY4Mj2rahqPKw+tQzNASSS5NTzTPEQ9ryLrJNWj+uczsoA42wrE
	jv8/709W8mpUjghKn1iygAMU3wfcm5nJ+TCOLXcy14vvVdLJsdxnBrudygWwMC/w9eP/JUYW59zMo
	VbBLGWPWAQqzTQQHxc8IHTvyFTSFABdzyGnQPd0NBVU9yF/Ns58o9CEWyvGu5UMZ45rZTEuLkatAX
	PXZlWjGlDep2Tm3vSV/CaBYb7L8i1xKVwrjr0wa4Oi6hqnQtUhay+JyiPh+sCG5VLwNpZhuK/OW0+
	22zoBJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERA1-000000044SY-0gMN;
	Thu, 30 Oct 2025 11:49:45 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vER9y-000000044S5-0qPs;
	Thu, 30 Oct 2025 11:49:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlcjuyFjt4cVeQUaANaqyExhfKZB0IhjI9sO3wNSjHkYcG7oijLlzBNkFyMGRKv5s8ZlpjzyH6dmArSXhxJgYf0K4ZQf7awy7fV+PIp9hV4Qns/6R79mnhBmpCLA8lSP7L5/5aMrfyS7lwuuZ7uSYT0DEoZPFfx3Q01Cz0yytTEDOuT+rssc1HbhyLxm9lMj0V+uq6mHaNlQMP/1XtIWepEU8WwbCI9d4qXdefyKxzQSvtZPc3oxlto7aUGgKNCkwn3FQ06yZagm6nNfIL37Rp789Gg7mmKqAZ4I+Qflt+BfUpGNCkYWBd4fpJodseupbiBXWF48t8dyBczxvm9UhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WFHHXC343xtw8qw5ieoMEjM87QdcemwJG3ZncvL8e0=;
 b=fAzVRZqD543u1WdrRQ3i010+ckA9P7aEA9PYUicqQTmqO414YdQ2DvJr3P5g1r5kQHPM8fY7ISmnUpz7/ChFYpcP7JuQ8QEa6N5AzaVyTi//k+4MqoYX6p6RMP+SHD9boUsBhHYEsgewtwNuv7kKXo0FbS9L6tdfXfozRFwSybQyUchqU8XlMyk52kzPaYtd9GPnaK6+7qGoIfHL08sawO/f10NLel80aG3RSwaESTl2BuI/hXHU14hibRRZk5oRrwbEu/knNOc839rLx2sU5R2ls1AbqKdoH3qzO/NYCSfp+9ezHrnad6ML+rbNb2YoVMLDQxDVBSAsR0+CfMJ7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WFHHXC343xtw8qw5ieoMEjM87QdcemwJG3ZncvL8e0=;
 b=fvURbuhT5hj2K7dyNfOQTUxIgKbzLiTwOBzrj0JaCBanpxq7A778Ci2VkkPYivDbXAx3VCnjEhGOQ7ZTK3NoprO+Fqv77N0cYV5dvWYfAbXqCO11BPrSgMqyQMLFUA/Rlv4EiCVZsKBZWnYEb0+xi4pP+Ul3Rk5GW8XSqlPOzYLOJ9IbeIDBWzUG887h29rJDHfe2LqYMoYtH2yc1CrPTJZJnv1xk3M7LZ0uwaa5FedOyzVgHVEUmRkS0yNvulqfGoJ7oY1KNplpaih8plC4T/sDuD0Di8TyVLWPKsEl+h+ofPYIn9ekbdIIMCJB35obCzTYK3c9kS/l7CwTEqPBKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB6506.apcprd03.prod.outlook.com (2603:1096:101:53::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 11:49:31 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 11:49:31 +0000
Message-ID: <1dea766d-d9c5-4951-889d-9a4f126c7924@amlogic.com>
Date: Thu, 30 Oct 2025 19:48:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: amlogic: Add handling for PLL lock failure
From: Chuan Liu <chuan.liu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 da@libre.computer
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
 <20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
 <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
 <4f245c6a-5a03-4321-bbf8-61249a7a550f@amlogic.com>
In-Reply-To: <4f245c6a-5a03-4321-bbf8-61249a7a550f@amlogic.com>
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e118f5-7fbf-4c25-e5d0-08de17aa6382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDdHaThTZENUaHBwaW5NUUVkbWdnR0NIa2o1ZmpZb1FGMGh6MytNVVMxOXhC?=
 =?utf-8?B?OENWblJMMTEwYjRzWEVGdXdyQU1TSE9oYjN2V1NBWDhlR0JXZFYrUEExeGpO?=
 =?utf-8?B?ZXhlMXZQaFZ0ai9pRDVta3lzZFF2eDdMalBOdlhkTnNNaUQzN0RLNGpGbG9k?=
 =?utf-8?B?TERsdVNMbXFaOTRmaHBnUTRIRjJzMVI1T3FlVndLY2M3U3R3Y0VrWnovTVNm?=
 =?utf-8?B?SmQ2V090MC83YnQ2K1NlR3B1d2FibFZiMWZBOG9Ua3Rmc2hId0pySXVUUUdi?=
 =?utf-8?B?VW9ocVhqdlJBWDEyRzVzbTFWUFZJUVNCMlNiWk5nOW4wRm52TEJmSXpDR1Ay?=
 =?utf-8?B?bGFGSHJBMVRQMGRNZGFZclpRdHlnMkFUR0JmL2l0NnErREZ3dDVVZHJ4bGo3?=
 =?utf-8?B?M1N3Uit5clpMSUs1dkc3OHpFWExWL1VXVlU1MGZ0LzYxd2tBNFFiQ1BNMFls?=
 =?utf-8?B?YnhSOHEyaHZIc3JCTFZ3Z1lDZ1JtSkJkQyswM3NibG1UVVNqZVRtUG1vUGVR?=
 =?utf-8?B?SmNLQzU1TWZJSkFCWXZMS1drbVI0M2pIYWhDSWZ3WnNIU0RkMDFIZEdhcVUx?=
 =?utf-8?B?aFdFSXJkb3pKN3EzTkRwUkYzeklQNy9BTjkybUdyTHc3VXp0RFNxMEt2WGZs?=
 =?utf-8?B?M3AwRTh6Um0vT3gxMXNiWjcrbTAxdHlzeVM0T1JWQ2FMRVg2dGhRcFJBOHp1?=
 =?utf-8?B?VXhkcG9pc29XTXBiMC83c0czRE9lWHcwek5ZdWdOeDUzSWNoRjc1ck5LeDZY?=
 =?utf-8?B?ZkkvQzh5Skw3a251Q0lDeFM2M1BFdThLVU8vdzdJVU8xTVpSVEtzby9OOTQ1?=
 =?utf-8?B?amJBcDNhTXJSNWlrSGxZeXdEZ2EyaTJob0xqQk1GOURmQllZK0syZkUvTDNl?=
 =?utf-8?B?UGxwZXVtelNRWU1LWlRHTnR1OGliekdkalBSNXNnc01LM0dLRkRzNVNIeHRZ?=
 =?utf-8?B?c3BrMmlydm9QQ2g2bkpwQXhzc1pTaUcwZmY5SytjQ3ZGKzgzcGZHRkg1Vjkw?=
 =?utf-8?B?b3NYRnVOd3IxQW1KcGFhK3VPbk5tSWMrMit5WnZFSWRSbXJqblBPeUtYREZJ?=
 =?utf-8?B?NHVobVFsOXVYTUVjNm9tbktObXg5T2JyV2FzcC80Yk1lc0pKNGZqeHdNWHlO?=
 =?utf-8?B?dTVhb3NqMFNlaS9OcFgyMGlianUvNDc4Wm84ZU40aGg4Qm1yVTJ6OGRnVFpX?=
 =?utf-8?B?b0xHUm9KVWlqaHUrSWg5WUJwRlNUdlFyaVJBOUwzczJnZWYxZFlRdWJFc2lQ?=
 =?utf-8?B?Mkp4YWtCeVpsZjVNNlFyelZlYS96Qk94MExscUF3NWxsRkxDOGxKVHZPTDBm?=
 =?utf-8?B?WERIZ0MzSVB1M2Jwb3Z6Z1kwT0hndFlwbHN4NE9WVDVaamtFQnVYcmtDZnlv?=
 =?utf-8?B?dnE0S3hLVVVtUHdqRW41ZWxPVkloNjg4c0NXUWtOWjJ5ckxzdG5mVCtGWmdn?=
 =?utf-8?B?cXpqck45NUtlTGh5ck5tbTMwYVZHT0xkK3ZvOEhhL1E1M1pwTy9TK1FCZXJ3?=
 =?utf-8?B?eVE0aWlvOEhENGkvaCtwbS9PbDNqUEZ6cHZzSmwwN3ZWMTVPNFRzanNpL1Rj?=
 =?utf-8?B?R3BtMWtTSStsYjljemY4VHo1dWhaZzIrNi82KzdWSGJWTDQ3WkF1cnJ5Rkls?=
 =?utf-8?B?UVlUU1VNWnFzWWMxanE4d2h5RE9RdWwwYUszeXlDNzNyY1c5SGpvV0syR2xl?=
 =?utf-8?B?dWNyU1l3L3JmZ2hkdWpBMHU5d1RrbG1kNi9lWEZKRWM0UnNhQW13WEtmM3Nr?=
 =?utf-8?B?YkNjTTdZK2UyalJvUFdkb1BSYkJ2WVdlYU1PMWxwd0FjK2V2bmloSUxJU0Ez?=
 =?utf-8?B?cElsV2RQVG5FYytSb2NZdkhHVFhzQjQ1TjhNMGd3WCtHTGQxUDVpUlpCTzI5?=
 =?utf-8?B?V0FKQk5iM0Rodjk5MndKanRSTTNOQVYyQ2dCOUxUejBnTll5Q0hlcFE1Y3Nt?=
 =?utf-8?Q?Wn6EVXMinAdWi+YKhL3duQAx1kbE48JY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBZakxwUjdFRWVpbndKWkxwKzk4NEJWa1M1eTBxL1UyNngzeXQ5N2lvQ2hB?=
 =?utf-8?B?cmpQUnJxMzYxYUUrSk9aQ0RaclJVVnZsYVFKUG9KUUQrRFpmTXBkK01pSkht?=
 =?utf-8?B?VkJkd0YrcVRqci8xMmR0VXhGN3Nzb3hscnZOcXFMRzN3T0paNnJuU3l6dGZi?=
 =?utf-8?B?OHVXZTRXOXB6bHdPUWVJOWVIUVl5MGhZNTdNcDh3MUdWWHRQZmk1WjN4eVI0?=
 =?utf-8?B?blN5cWhEU29FWkMwRnovMUxkWWhPSUNIMnRBZng1aUlmYkdsb09scURDOVF0?=
 =?utf-8?B?SEpCNkR4M3hiMFYyeFJuajBTZW0wYlVFaDFYOFhGbmhTK3cwVUh4UXR6aXE4?=
 =?utf-8?B?bXQ3b2xWQ29yM0tSSEN4WUpPSnVrQnZjcTlvZW9kZEJuNk1vc2FtVUQzU21v?=
 =?utf-8?B?Unp2S2VNYjZnY0ZrWDFDM2tTTXU3bkRvTWtHdGZ3ZTJ0STE1UENwZTRiem5Y?=
 =?utf-8?B?bUYvdEZGK1RhR1pJUFdCalN4bjR1b0IxS0kzWmNKNkd3YnFqb1BPaCtCdFQ2?=
 =?utf-8?B?M3VGaXNUWXJzcWk3OHVObE92aXVkRlhpTHErZ1RQTHVqb0ovVEMrcWFoTHJr?=
 =?utf-8?B?V2M2dGRFcTJLZzhneHY0enBaTWFkdmdSdFVoRysrWE0rWHlhQkZrbHc0TnNo?=
 =?utf-8?B?MHd6V01GbDBuY1dRMlNVdHJ0Q1Azb0VpdDBSK2xqRGZHVTZGK3Jsc3ZXVm1h?=
 =?utf-8?B?WXo2bCsraFphOE9xTU5vQzBKOWdTbVY3UWo0UlQwbC9Gd2M3dmZ3citqZ1RG?=
 =?utf-8?B?Rm5FTXNCbVMvdWN2cEt1MzdiZGlvRjg0MjYvSXI5cExkWmxaWUluQU1XYW0z?=
 =?utf-8?B?Y3RQU3E2Z3BBWmN3dk1wc2NKSmxoMVdtZWFCVUhBWDNBajRYZm9GM05CS09H?=
 =?utf-8?B?OWtYQ1dyYjJQcmFnaXpPaUVWdkc5WEhkTlNjbUNGV1ZYcVR0MzY5cFRDb1Fj?=
 =?utf-8?B?eVNGNDJDZWZ2V2pvVi9mSGJXcmVmRnR3cnFucHhRdkk3ZE1PUDJvMUt5RXNs?=
 =?utf-8?B?NjBLZ1pvSEZiME8zRWNJbVVWTEJ5d21GL1VRZlhkaDlEMG4yMmFVRmJpalRI?=
 =?utf-8?B?R3dITFZVcndaMEZUU2VzTGxNY1lWempGKzFsaURkUk4wcEpoOENZM1h6TW11?=
 =?utf-8?B?Wno5YTJRVERTVzlvSlFDeFJpaW9MZW1QOHNXR2dKb0htQ2RTTkRzVnZrZVI1?=
 =?utf-8?B?bjBYTDZkeDNMSVpHT3VmRU1RaG5GM1EvOWxMODIzLzIraVdsUnNlQmVyVmxa?=
 =?utf-8?B?aWFubHNxQnVwNkRGUGc4MzdmNjJjOGorS3JaQjZPUmZEKy82TithK3lWSG03?=
 =?utf-8?B?M0hBRFFOYmVPNG5MVlA1VHlvUmwzNVlnZk56QUx2b0ltY1NGSEUreHMvV2h3?=
 =?utf-8?B?OFJwd21sWHkvcmFmaTVEUjdkQkt4bk9EbVg1LzFKa0c4RTNSRk9ybU1uemlG?=
 =?utf-8?B?Y1ZpVW5zR2xHbXFNUFlOT0NWNW83QnVzRkxsTW15SmRYc2dsbDV1U2o4d1dw?=
 =?utf-8?B?U1I2QlBnYVE1cFZBaGFTdEEzYVl6V1VlaDRVZGNPTE5NQy8ydUlQcTlTM0Jo?=
 =?utf-8?B?VS9wQzhlZ3lZRWV3Sk1BQzZhektXRlptSXJKR1U5OXEvNjd3UHhWOTFnRXB5?=
 =?utf-8?B?ajlMYzRQbVNZTlFsN1pRbkNqRWMwendHOHBPUTM0UWZ6dUxKaitkYVhLbzht?=
 =?utf-8?B?dmRQcG1BUXZZb2hNcGxyYVhtQ3IvMUIxZ0hhWnUvb2d0TXRQUHVmTFBaUVhV?=
 =?utf-8?B?T2ZDRDJrb1Z6TlJxYWhuYmZhQXY2eVlJUFljWndqL0pVUUdCaUNtVUREcFF1?=
 =?utf-8?B?all5MFZtZ1dDRUJqcURwRkhoc0wyenc2Ymd0SHlac2tVbVRYNnBrQkNFR1dX?=
 =?utf-8?B?cnMyYmFVVCtxMXgxTldLZTZPSjA5REFOank3akxKNnp0TWpvSGNTNi8yTys2?=
 =?utf-8?B?cDF6N3UxcHVDUEd4TmNOcytYM21pQXFwWGJ2ZXNDbnlxSTl5QVZBZ24wVkpO?=
 =?utf-8?B?RVM0d2dkSlh2czhuT09WSzRWNll1WVRPZXJCU0dlQTlMZzdJVGJuZjR3a2Qr?=
 =?utf-8?B?UGowWlJkejFtYkJ4NW5adUd5aXU1WGNnN3czSTAwdmFJc2V2SVpPeHhNazM1?=
 =?utf-8?Q?Kio1gA0wlwnK1lFltovyX/qzX?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e118f5-7fbf-4c25-e5d0-08de17aa6382
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:49:31.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnZc2wagSCntsclpg2doT8XeNXY0Iu/C6c2uNRQfWeJXEjwtsWcEBb0PnmmMr9lMRwCpmPAO6n0A2DJbneQxlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_044942_279844_CEA2965E 
X-CRM114-Status: GOOD (  19.85  )
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

SGkgSmVyb21lLAoKT24gMTAvMzAvMjAyNSA1OjE1IFBNLCBDaHVhbiBMaXUgd3JvdGU6Cj4gSGkg
SmVyb21lLAo+IAo+IE9uIDEwLzMwLzIwMjUgNDozMiBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIFRodSAzMCBPY3QgMjAyNSBhdCAxMzoyNCwg
Q2h1YW4gTGl1IHZpYSBCNCBSZWxheSAKPj4gPGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29t
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+Pj4gRnJvbTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1s
b2dpYy5jb20+Cj4+Pgo+Pj4gSWYgdGhlIFBMTCBmYWlscyB0byBsb2NrLCBpdCBzaG91bGQgYmUg
ZGlzYWJsZWQsIFRoaXMgbWFrZXMgdGhlIGxvZ2ljCj4+PiBtb3JlIGNvbXBsZXRlLCBhbmQgYWxz
byBoZWxwcyBzYXZlIHVubmVjZXNzYXJ5IHBvd2VyIGNvbnN1bXB0aW9uIHdoZW4KPj4+IHRoZSBQ
TEwgaXMgbWFsZnVuY3Rpb25pbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1YW4gTGl1IDxj
aHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL2Ns
ay1wbGwuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysgCj4+PiArLS0tLS0tLS0tLS0tLS0t
LS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyBiL2Ry
aXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gaW5kZXggZjgxZWJmNmNjOTgxLi42Yzc5NGFk
YjhjY2QgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPj4+ICsr
KyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gQEAgLTM1Myw2ICszNTMsMjMgQEAg
c3RhdGljIGludCBtZXNvbl9jbGtfcGNpZV9wbGxfZW5hYmxlKHN0cnVjdCAKPj4+IGNsa19odyAq
aHcpCj4+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87Cj4+PiDCoCB9Cj4+Pgo+Pj4gK3N0YXRp
YyB2b2lkIG1lc29uX2Nsa19wbGxfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4+ICt7Cj4+
PiArwqDCoMKgwqAgc3RydWN0IGNsa19yZWdtYXAgKmNsayA9IHRvX2Nsa19yZWdtYXAoaHcpOwo+
Pj4gK8KgwqDCoMKgIHN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEgKnBsbCA9IG1lc29uX2Nsa19w
bGxfZGF0YShjbGspOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgIC8qIFB1dCB0aGUgcGxsIGlzIGluIHJl
c2V0ICovCj4+PiArwqDCoMKgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3Qp
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFw
LCAmcGxsLT5yc3QsIDEpOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgIC8qIERpc2FibGUgdGhlIHBsbCAq
Lwo+Pj4gK8KgwqDCoMKgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmVuLCAwKTsK
Pj4+ICsKPj4+ICvCoMKgwqDCoCAvKiBEaXNhYmxlIFBMTCBpbnRlcm5hbCBzZWxmLWFkYXB0aW9u
IGN1cnJlbnQgbW9kdWxlICovCj4+PiArwqDCoMKgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJM
RSgmcGxsLT5jdXJyZW50X2VuKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25f
cGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMCk7Cj4+PiArfQo+Pj4gKwo+
Pj4gwqAgc3RhdGljIGludCBtZXNvbl9jbGtfcGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykK
Pj4+IMKgIHsKPj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrX3JlZ21hcCAqY2xrID0gdG9fY2xr
X3JlZ21hcChodyk7Cj4+PiBAQCAtMzk3LDI5ICs0MTQsMTcgQEAgc3RhdGljIGludCBtZXNvbl9j
bGtfcGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDApOwo+
Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Cj4+PiAtwqDCoMKgwqAgaWYgKG1lc29uX2Nsa19wbGxfd2Fp
dF9sb2NrKGh3KSkKPj4+ICvCoMKgwqDCoCBpZiAobWVzb25fY2xrX3BsbF93YWl0X2xvY2soaHcp
KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRpc2FibGUgUExMIHdoZW4gUExM
IGxvY2sgZmFpbGVkLiAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXNvbl9jbGtf
cGxsX2Rpc2FibGUoaHcpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl93YXJuKCIl
czogUExMIGxvY2sgZmFpbGVkISEhXG4iLCBjbGtfaHdfZ2V0X25hbWUoaHcpKTsKPj4+ICsKPj4K
Pj4gVGhpcyBpcyBzb21ldGhpbmcgdGhhdCdzIGxpa2VseSB0byBzcGFtLCBzbyBwcl93YXJuX29u
Y2UoKSAoaWYgeW91IAo+PiBtdXN0IHdhcm4pCgpEaWZmZXJlbnQgUExMcyBvciBkaWZmZXJlbnQg
dGltaW5nIGNvbmRpdGlvbnMgbWF5IHRyaWdnZXIgUExMIGxvY2sKZmFpbHVyZXMgcmVwZWF0ZWRs
eSwgc28gdXNpbmcgcHJfd2Fybl9vbmNlKCkgbWlnaHQgbm90IGFjaGlldmUgdGhlCmludGVuZGVk
IGVmZmVjdC4KCkRvIHlvdSBtaW5kIGtlZXBpbmcgcHJfd2FybigpIGhlcmU/Cgo+PiBhbmQgSSBk
b24ndCB0aGluayAzICIhIiBhcmUgbmVjZXNzYXJ5IHRvIGNvbnZleSB0aGUgbWVzc2FnZS4KPj4K
PiAKPiBJbiB0aGUgbmV4dCB2ZXJzaW9uLCBJJ2xsIHJlbW92ZSB0aGUgIiEiLCBhbmQgcmVwbGFj
ZSBwcl93YXJuIHRvCj4gcHJfd2Fybl9vbmNlLgo+IAo+IFNvbWUgZHJpdmVycyB0aGF0IHJlZmVy
ZW5jZSB0aGUgY2xvY2sgbWF5IG5vdCBjaGVjayB0aGUgZnVuY3Rpb27igJlzCj4gcmV0dXJuIHZh
bHVlIChldmVuIHRob3VnaCB0aGF0J3Mgbm90IGlkZWFsKSwgc28gYWRkaW5nIHRoaXMgd2Fybmlu
Zwo+IG1ha2VzIHRoZSBpc3N1ZSBtb3JlIG5vdGljZWFibGUuCj4gCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlPOwo+Pj4gK8KgwqDCoMKgIH0KPj4+Cj4+PiDCoMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiDCoCB9Cj4+Pgo+Pj4gLXN0YXRpYyB2b2lkIG1lc29uX2Ns
a19wbGxfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4+IC17Cj4+PiAtwqDCoMKgwqAgc3Ry
dWN0IGNsa19yZWdtYXAgKmNsayA9IHRvX2Nsa19yZWdtYXAoaHcpOwo+Pj4gLcKgwqDCoMKgIHN0
cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEgKnBsbCA9IG1lc29uX2Nsa19wbGxfZGF0YShjbGspOwo+
Pj4gLQo+Pj4gLcKgwqDCoMKgIC8qIFB1dCB0aGUgcGxsIGlzIGluIHJlc2V0ICovCj4+PiAtwqDC
oMKgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQo+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDEp
Owo+Pj4gLQo+Pj4gLcKgwqDCoMKgIC8qIERpc2FibGUgdGhlIHBsbCAqLwo+Pj4gLcKgwqDCoMKg
IG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmVuLCAwKTsKPj4+IC0KPj4+IC3CoMKg
wqDCoCAvKiBEaXNhYmxlIFBMTCBpbnRlcm5hbCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQgbW9kdWxl
ICovCj4+PiAtwqDCoMKgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5jdXJyZW50
X2VuKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25fcGFybV93cml0ZShjbGst
Pm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMCk7Cj4+PiAtfQo+Pj4gLQo+Pj4gwqAgc3RhdGljIGlu
dCBtZXNvbl9jbGtfcGxsX3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25n
IAo+Pj4gcmF0ZSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBwYXJlbnRfcmF0ZSkKPj4+IMKg
IHsKPj4KPj4gLS0gCj4+IEplcm9tZQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
