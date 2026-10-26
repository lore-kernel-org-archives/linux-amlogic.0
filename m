Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D6606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbpJlI4J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=YIa/uyfg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4IqHyvPpMSVORkeRm/svjZ1Rz6ye1cP1bRwXlSglJzE=; b=IbpJlI4JUdtuujf/8LYIkh7eaZ
	KF6560ZzYWS1Xrmbk87aX8aDye24QArdWEMvcFgkG34bnvJd+NBRwOam6dJ5E5T6ksxNMcVl92HA9
	H+RTFubBpWDYthTY6a4C+a5ltNe2tvY4sEkXF34+uunaIKJqin2Y9Ht8e+fT88nkcB3B7ypEQqJ/z
	qTPOkwz+9pA+iZaiKVUnYaq4Ep1neCWq4nyjIwpwWHOAKwv+HQH3nngB0KapjT0H3grOXsOlBzj//
	Ejb1amUggH11RVhZKDlusiPXzjGlG6DUGYaQdbBU/KnGcXJVEcttEtIMyssHvWKknqxAKeoEv/ukr
	4ujEFpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHf1-00000002Ef9-2Qip;
	Mon, 26 Oct 2026 10:10:35 +0000
Received: from mail-westeuropeazolkn19010002.outbound.protection.outlook.com ([52.103.33.2] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHex-00000002EdC-1jKQ;
	Mon, 26 Oct 2026 10:10:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0DICkUa8dvc7cnfiGESLdrYHs/wuGOYhv2OuuZ7dwWJ6BJqiaHNdyBUxER7x6DjGM9XW+25/rYZo5RXu6hDtE0F+z/NumrECy1FFK10fBA5hpJhzw0SbFydglHKm7o60wT+zX+/DR3nMmfARF/1WuYGZQJ0Yv8fRwl4UkGbmr/1Uyiqnz91NRKdmx6926csOD0sJowcRT4uCYKBEkIzroxy8dapECvMjDnbaUmN5Hud6siROXZf2mrcSUubHxlhgDEWxfT74wfCzGALfrY9P1cZ8McIJPY7XwUM7B29UXSe2N+m2v5JDCWCtiTZ4d+BkQRZT2iWpC34/UcqBKa3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo/Ba94vurq4f/2y0LlL+T4zH6vWnNxm3XHj0C8mvQ0=;
 b=l879WKx8fCBcsTBgMVu7VIc0rIkj/wS5z7fRvuK66jq+GYDtJK1Oj5tquktIcbsyaFqX0xahcxhBgl/TMZMkvwtL/BMr6mjzLVAejEl/VMQLHilnx5n1llY4KFX/lR3+cdba4ve7pOHDEKmcawAjj7k+8NBRyBW2NpH/qA5i8bLSVrI0aJ+08J2LLcsE9Oq68ie91Wc+EQFhWhgnlOFVFpO76m9+ujUmvYuodTbC4Ms2XbotrfetN043+Rx8MlfDtj6/RBBowvUFg3li3tAqFvFuzqddO7POppconfmJrpyW3TC8ye7OvgE4eu5Z5QfxTfGV19DzEIxBYEjQL0314w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo/Ba94vurq4f/2y0LlL+T4zH6vWnNxm3XHj0C8mvQ0=;
 b=YIa/uyfgZkZo6cALdSY0vbdEA72Mr/xPkUiGGRtr/0gCU3IP3+YyTRh43rUBeQQYeXdiTVa5+7thgKbSYj3ATzHsZjPUXTF8CBO8Nlbt8JglvIj9312T4pzJzQsbXvyyx77Sbcj+PA5Ed3++r0Ru4yE1cNnHq6Fk3/yRH0RkEeeT6cXA6/RLvJh30U2F1j4cU8rNhbBgE29HM9UcfnZeNl8FcL+LyFhCZracdAbdeSFtntkS3Klf2AByWV8WgMRcT3lE28u5K8cQOO7xrA/7SX0+meM9Pj82Qyz2plIs1yBhirM2to8W7we/6Mm5ua31kYgEJPlcLPUOVQfDVUrzkQ==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by AS8PR08MB9361.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 26 Oct
 2026 10:10:26 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:10:26 +0000
Message-ID: <MMZPR08MB54931587B388DDCDBCE0742500DF612@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Mon, 26 Oct 2026 11:10:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, rafael@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID: <71c1ba2b-e35a-4b1f-a80c-dddcb951a2c3@outlook.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|AS8PR08MB9361:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c00ff7c-10e6-4e13-8b39-08df33495b26
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|25010399006|19110799012|23021999003|8060799015|5072599009|15080799012|19101099003|6090799003|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZitiVGFHTTlZNld1Wnp5bEwxUEk5TVNLc3lrazdrTTFnQjRrUkJzZldYazdl?=
 =?utf-8?B?VHBFeE5ISjNod0FCcHJQd2pQakRxVVJ5QjFscEZMcjMvWEp0eE45dEgyVzZw?=
 =?utf-8?B?Yjhwa0lkSmFkck9tZ2xFQ1A2ZXdOaDhTb2VlZWNxOE11clhhZXIvVWhEL2cx?=
 =?utf-8?B?ZGNlc1NhVFJ0MlNBYm8rOWV1NWF3VzB1VzZKM1hkR0pqdk1OM3l4cThjTGhh?=
 =?utf-8?B?RDY0RTF1NytJRHYrQTUvVXNhUnNOcWluTUtRTFRPdUF4VkZDOVZacG1kMTVK?=
 =?utf-8?B?VWFsSEZKbEZlRkhTOVkyY2EyRUFDMDVObjc3cmF6NGlzMXFSQ0h1cVBxZkU3?=
 =?utf-8?B?YmFBL3NCU3R3SXEzNXk4cjhZVmpRcy9UeG1DeUZDRSs3ZkdzS2U3ZFNZRTJ1?=
 =?utf-8?B?c3dRMkJ6SVA2b1IzeXcwYUhyaFhNanAwcFhMVzFPci9zMUVhTHluU1A1cUw5?=
 =?utf-8?B?UHBraTd1NkVla0h2Z1N6eFBqSVBBNEh2SnpmVDlaMVpJc0t5aDlCa0NMdDFh?=
 =?utf-8?B?QzNsV3NKSktna3NtaVFTVzJFR2N2OTFRVW5EUXMzY2FnNWtsczBrS1BVblhW?=
 =?utf-8?B?M2dKVGtHeDc4RG1DSk50WW53NmQyRFJCMEt4REdVV1lobnlBVjhmQjlpTG9K?=
 =?utf-8?B?WFJxRDVFTk9OT05GOVRuVHZ6SXNENEZjM3I0dk50ZEk5TlVQYUxEUVBlZ0pj?=
 =?utf-8?B?cS9VNWRjenZmUTVQbTZXaGpNTEVOQkNuclVsdnhqL3dvVGRrUnJ6Uk1ncDln?=
 =?utf-8?B?R0pmOEYwNVNsTUU0MjZhZEF1MG56Wnp6RVo2V1VabE1LZ25NaGsrKy8yb1lv?=
 =?utf-8?B?T3hNemROVHZQbmpTU0dEWVMyOGs4MEpqQk1iZG5ZYlltMDdTUUZna0dUUStB?=
 =?utf-8?B?bnNuZThFMnllRkk1cXBPRHNuZVBXR0QzczhwSGp0M0VTSDRyOG9FbEkxNUw1?=
 =?utf-8?B?eFN6OUk5a1hDQlVJVHBhQmpUb05yVDZBRG1Za3BYZG41dGkwT2tiNGRqdDFt?=
 =?utf-8?B?WU42OEcvQlpJa0RINWgyOG9KMjEwOVpxSXM2Z1ZGSnh5WGFCKzk0RHJzajhs?=
 =?utf-8?B?ZlNCbTZkc1JqUmNtVU40M2E0RkYvVHp2eVUxa2dXVUE3YmR2ZnlGTWdzUnl5?=
 =?utf-8?B?TzY2Z0xieHdLcmRMYkNEcjBOYndKVG5vVTFtWGliTU9NQmFsdXF2TTF5WEdv?=
 =?utf-8?B?YVpzSytNb25takduRUs4SnNVWDhQbzV3bEdKSkw0Qmtjd0pXaWN4TDZ5RW9R?=
 =?utf-8?B?UGlEVUhRempPUXNHQmxRdGd5elprK1IxcXpjcXg3VDVvYTFmNzBXaE5EWmR0?=
 =?utf-8?Q?wWyREvtUixg02+PODs7ApyRZ/eDmH83ASG?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBqNlMwNkZ0dlRFc2JoUEJnR3ZMa3phdTB4azRva1dLMTRPMDJJSUczcUZT?=
 =?utf-8?B?cGRGUFk1OEZjbWtPT2hKZDVKUjBhRENxSWdwa3dLNEhCS3diYWtPYjkySE9E?=
 =?utf-8?B?ckQvNG4zdHlSbitjQUtUTjg4VC9UQ0JWMWpRL0t3L3VIWnVaeXFSaXR3RE9n?=
 =?utf-8?B?enRhN0J6dVk3QjR0bWtLdGs4SFZXVjZsdm9JdjFmMW9qc2x6VkdDNk53Ykhy?=
 =?utf-8?B?VUJPSTlGb1Evc3cyZ0ZJcnAxMXJXWHk2WU5MbVlEUG8wV1U5VkhXMEpPTFJV?=
 =?utf-8?B?Ny9tVytMM3NDL1NVaDJON29qMWhWbGtrRmhSZDVJVXRXV05EdUE3aWgxTFBv?=
 =?utf-8?B?dExkN3FxT0hEOE5rM3JwZnhJajNyUEtOTzFDem0weVFyejFaN0xqMCtYaXoz?=
 =?utf-8?B?Q2xuNHpxbHFJclBVeXloVXVxOVcvSkd5TDRtejlvN0NZcVl2V1JtK3Y5MWI2?=
 =?utf-8?B?S0x3alNrbmxDT3RrL1BaOWpjekFDOTdvU0pXODJVSktPYVlrMEY0V2tyNkJ3?=
 =?utf-8?B?ZlJqT042aDA4QzdlVnRNcnJzc0QvN2ZUWXNiVm8zOVVzc2ZKL0pzaTRLMTNk?=
 =?utf-8?B?SzBmRVBaVFFRNEl3STNiWlZNVjAreEcxTkF2T20wNWhoQW9rREZ5ckhPa3JF?=
 =?utf-8?B?Rk1mT1JXYUNRNTV2Z3JNOXVtQzJ5dXdKc081VlRpanUzTEd3NXRHcW53US95?=
 =?utf-8?B?ZlZkb0liSG5YN0Y3OUlEQXFCMGtTSkNGMzZuUk0yWXNGcG1idm12N3pqNHd5?=
 =?utf-8?B?NmI5enNXZnI0dEdnWHBpQkMrRERxNVlRdzBOTHRSeDRnWkh5aVpyMVo1LytI?=
 =?utf-8?B?VUtXcVgzZmhXKzhwLzVjNnFKS3RpSWI4Y0lWMkQ2YzljT21lVy9HM3FLNjJB?=
 =?utf-8?B?SG9DZlh4emVPNmQ2QWwxeVlKZmZibE9vWWV2QzBjbEw5ejhIbkl2TC83dmsr?=
 =?utf-8?B?cTcrSXVjWm1DcTB3L1dWTVZJQTZVczIwSHNJQ0kyOGNCVEtySkIrVHAxZ010?=
 =?utf-8?B?aThVWVZIUVIyU0E0L2E1eERnNmlpRVE2RS9PY1NnZnB0NVFNUXdvUzNFOHhi?=
 =?utf-8?B?SGRjTks1cTVlQml4UVcvRS8xNzROczBhNDcyV3dsQ2xscWlyNlRRZ2xJOEZh?=
 =?utf-8?B?dlQvK0ZDZ0pqN3gxb21nTkxOVU5xRnNJTEI2WFFWd0RTTDZZblNHVTVJMkpl?=
 =?utf-8?B?MGRLSlRobmRCenlUc1VJd0IvOExGTjRSaG43eEdkRkxna3hRUHo0V0kzcnll?=
 =?utf-8?B?Vm9sTXJFZDNvWWh0bTM5TDUwYjhtOGhCbEFUNi9KalpzNzg3RUZ3UUFaT01L?=
 =?utf-8?B?WEMxQmRXd08xeDBlbXJVcG44WFp5ZE9iUitaaVBUWHBFeXd3OGRYYUlIUXRs?=
 =?utf-8?B?Y3paS2I3YXZiNzdXeWdZWklmNW9DV25lZUVxMTc5Tm5YdmRDYWx5VktFY1Z4?=
 =?utf-8?B?ajBIOTd2NmpicUJzRjh4ajdzcVB6Sk4rMWNmYTBESkRUVGhDZTMzaUZIWWVa?=
 =?utf-8?B?Znh3L3hDRUxzYzlwd3FNQTg4WlA2ZU01ck54V20xZ2ZjdlBkV0cyRm16bGgz?=
 =?utf-8?B?NDBSR3FiVGk3ZUFvdW9OMlkrYzVVVWVSTm5jZmhidjd5SlVPMlo3MnMxdzBT?=
 =?utf-8?B?ZUF0MUo5YnNmeVV5a2hYRHFpbE1NM2x3SUFZT1hPRWI0d0RhdElrYmdWSDZk?=
 =?utf-8?B?QUdTTWVFbFNzdTZHNmdua1ZkRys5VHkreW4zbm1HWGFqN1dLMGRLN2ZHamZy?=
 =?utf-8?B?bVNheGVWUGJBWCs0QVgzTlN0YytOekl6RWZhcHFyUzNvb2ZUODZ1bmJiL3Fx?=
 =?utf-8?B?R0k0R0ZCb3QyQW84S1haK3p2RDN5UExNNzFjbGxhVzYwTG5PRzFINEl3RmJT?=
 =?utf-8?Q?LCHGv785fZHTG?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c00ff7c-10e6-4e13-8b39-08df33495b26
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:10:26.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_031031_467607_AF308B3A 
X-CRM114-Status: GOOD (  14.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmlyZXNoLApIaSBKZXJvbWUsCgpPbiAxMC8yNi8yNiAwOTo1NywgSmVyb21lIEJydW5ldCB3
cm90ZToKPiBPbiBsdW4uIDI2IG9jdC4gMjAyNiBhdCAxMTowMCwgVmlyZXNoIEt1bWFyIDx2aXJl
c2gua3VtYXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPj4gT24gMjUtMTAtMjYsIDIwOjIyLCBjaHJp
c3RpYW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdCB3cm90ZToKPj4+IEZyb206IENo
cmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+Pj4KPj4+
IEV2ZXJ5IFM0IHNwZWVkIGJpbiBydW5zIHRoZSBzYW1lIENQVSBmcmVxdWVuY2llcyBidXQgbmVl
ZHMgaXRzIG93bgo+Pj4gdm9sdGFnZSBjdXJ2ZSwgYW5kIHRoZSBiaW4gY2FuIG9ubHkgYmUgcmVh
ZCB0aHJvdWdoIHRoZSBzZWN1cmUgbW9uaXRvci4KPj4+Cj4+PiBSZWFkIHRoZSBiaW4gZnJvbSB0
aGUgZmlybXdhcmUsIHNlbGVjdCB0aGUgbWF0Y2hpbmcKPj4+ICJvcHAtbWljcm92b2x0LXNwZWVk
PGJpbj4iIHByb3BlcnR5IGZvciBhbGwgQ1BVcywgdGhlbiByZWdpc3Rlcgo+Pj4gY3B1ZnJlcS1k
dC4gQmlucyBvdXRzaWRlIHRoZSBrbm93biByYW5nZSBmYWxsIGJhY2sgdG8gYmluIDAsIHdoaWNo
Cj4+PiBoYXMgdGhlIGhpZ2hlc3Qgdm9sdGFnZXMuIExpa2Ugc3VuNTBpLWNwdWZyZXEtbnZtZW0s
IHRoZSBkcml2ZXIgYmluZHMKPj4+IG9uIHRoZSBTb0MgY29tcGF0aWJsZSBhbmQgbmVlZHMgbm8g
bm9kZSBvZiBpdHMgb3duLCBhbmQgUzQgaXMgYWRkZWQgdG8KPj4+IHRoZSBjcHVmcmVxLWR0LXBs
YXRkZXYgYmxvY2tsaXN0IHNvIGNwdWZyZXEtZHQgaXMgb25seSBjcmVhdGVkIGFmdGVyCj4+PiB0
aGUgYmluIGhhcyBiZWVuIGFwcGxpZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4+PiAtLS0KPj4+ICAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4+ICAgZHJpdmVy
cy9jcHVmcmVxL0tjb25maWcuYXJtICAgICAgICAgIHwgIDE0ICsrCj4+PiAgIGRyaXZlcnMvY3B1
ZnJlcS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4+PiAgIGRyaXZlcnMvY3B1ZnJlcS9h
bWxvZ2ljLWNwdWZyZXEuYyAgICB8IDE4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
ICAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jIHwgICAyICsKPj4+ICAgNSBm
aWxlcyBjaGFuZ2VkLCAyMDIgaW5zZXJ0aW9ucygrKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9jcHVmcmVxL2FtbG9naWMtY3B1ZnJlcS5jCj4+IElzIGl0IHNhZmUgdG8gYXBwbHkg
anVzdCB0aGlzIG9uZSA/IEkgY2FuIHRha2UgdGhpcyB2aWEgdGhlIFBNIHRyZWUgdGhlbi4KPiBJ
IHdvdWxkIGFkdmlzZSB0byB3YWl0IGEgbGl0dGxlIGZvciBBbWxvZ2ljIHRvIGNoaW1lIGluLgo+
Cj4gUGF0Y2ggMiBpcyBzb21ldGhpbmcgSSBhbHJlYWR5IHJlamVjdGVkIGJhY2sgd2hlbiBTNCBz
dXBwb3J0IHdhcwo+IGluaXRpYWxseSBpbnRyb2R1Y2VkLiBJIHN1cHBvc2UgQUkganVzdCB1bmVh
cnRoZWQgaXQgYW5kIGRpZCBub3QgYm90aGVyCj4gdG8gbWVudGlvbiBpdC4KPgo+IEFtbG9naWMg
d2FzIHN1cHBvc2VkIHRvIG1pZ3JhdGUgdG8gU0NNSSBhdCB0aGF0IHBvaW50LCBhbmQgcG9zc2li
bHkKPiBoYW5kbGUgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nIHRocm91Z2ggdGhlIHNlY3VyZSBmdyBl
bnRpcmVseS4KPgo+IFRoZXkgZGlkIG9uIGxhdGVyIFNvQ3MsIEkgZG9uJ3Qga25vdyB3aGVyZSB0
aGVpciBGVyBzdGFuZHMgb24gdGhlIFM0LgoKSW4gbXkgYm9hcmQncyBmaXJtd2FyZSB0aGVyZSBp
cyBubyBTQ01JLiBDUFUgRFZGUyBvbmx5IHdvcmtzIHRocm91Z2ggdGhlIApjbG9jayBTTUNzLgoK
QmVzdCByZWdhcmRzLApDaHJpc3RpYW4KCj4KPj4gLS0gCj4+IHZpcmVzaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
