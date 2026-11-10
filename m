Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684A660A2606
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yVaW+TsC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=hQ7dvdCY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/wuCRk7PjCVMPGd/AsY5NxJosTGzvOzhzPTkjZYzvOY=; b=yVaW+TsC9K7fIfwrLNc/0gFOpe
	h1j6/NN+/k/VbWkuX7W+HSeEXoAl4Ioqymo/zH5+13BE/PfGLrs/KdUuCfoKsIviWZz56opl/TZyl
	sdqxGkV6uSAUve0uoP2EAZwk5fIQTN8sfRR3JPu82lqHa+md0rJdECHHAtH39V4wSjF6a2yTWDk82
	witBaw4Rmi4HnIqt3dojpW/wRY99o4mj9rVf4F6ykT3VuRjD7gtWD9I1rK8AUbII4FoqkVIgcTNmS
	7/9673b73J7jKM2nVjX9qTgWtY7bJYNlzXMwqslSvS60megQVhXfP2aKNJsnRHPI/4u7LOuQmE8TE
	oDqYSYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkFv-00000003fMb-1oHW;
	Tue, 10 Nov 2026 11:43:15 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkFs-00000003fLC-2zub;
	Tue, 10 Nov 2026 11:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unqZkoNpeem/VQHgRElIFlk0GOisZhzZy0MiJ6e52AI8SCOctYuY+54OE0lpvmhNp+La8ZJfwhsxij6LlWvD41TkMGRmpKtsM3wgmvk3bagCEVhWy7QdGvPDgWEBX3vTZ9hdxQ1NZEG0jPaJorA0U9c7xvT1uJa2wurg5AEA6QyrS9xsUL7S2quU9PlIns300Sr1VJT6s3HJmqpSMQENPmR28NdpNt6QcqJUHxRPnzdZB0ods/4Wl3hdyQ0NvzFYRDEmzS9ljXwWfOFD67kIHQhg4d3ZR6SUu2VN5q4bQadELv5nuO1xH+DkkurqUtckzGSz6AVsxs/BR3LNkF/OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyRTBSd4eog+UQSbF3AGOcW7ej/XlHx0mO7UwzoYECY=;
 b=FY/GeYcXiu0fTLJFiVOYzhTFzMYY5jqWmTy1/ezJyL0gJ+GrVqg3JRy+0abZpE2XmzvuGMmDLQozA+ugcG/C0JiXL2CnYIrB5xnaBBsdDqU/dEyF25G9THvpmV2T1aoe1p1ENuEiTi3Cv33fD53E5vYVuSVhUUqB6ExaO0Y6PAXJ6Z/JXNyZy6VZeQK8RD+lJfbAQLqx4nVhex8yjdT9ckf3poekrTDtEiZMyjbOVoj4GlAsgfmYnNRoNlo2NGHW8raHBZbr8zb2cM1T5uxGdgYIYXq9UeCHWdJXKM+Hkrhh8Kv41+6SWDKeCVJlv9CVzlaZBCWaEHklRaHwY6UxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyRTBSd4eog+UQSbF3AGOcW7ej/XlHx0mO7UwzoYECY=;
 b=hQ7dvdCY33Jq1DDXJZ0OYbrGm+iekadDqKaZKBP6RU2HgyMIvFUwuE2I/naM/mtP70zjBdPJPqlZ/kpMYlv3eTXFWsR5/8+UyOrdMon+q3MZnxLS8rejPk1BvfKt20G3EoLiHvzyHeFJWg6qk7H8IC23lgJsWs/0KIeUD1nE6VJiMhrRODj/TrxZijAb57neloip22j0+UfAEegGmn1xj+Uhvha0MTzxmgOSjjnIMQPD5UkLWG8JoxPWVrHyr9DEbyi3Txgn2uJi7gAZBQXoo8Yb+DgwFNq+Kibq9j9O4pniWVus/sLpZycQiGNICzzbFiYTEgBPDGAUuffnW8qgFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by JH0PR03MB7853.apcprd03.prod.outlook.com (2603:1096:990:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 11:43:02 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 11:43:02 +0000
Message-ID: <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
Date: Tue, 10 Nov 2026 19:42:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
To: tanure@linux.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261103163715.385394-1-tanure@linux.com>
 <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
 <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
 <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
X-ClientProxiedBy: TP0P295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::13) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|JH0PR03MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 6351b656-5a9d-4269-52d5-08df3f1fc6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: +UevEOhqQfR/thcKvJmA5gT0pu7eoGYwNsQIaRRV16rnomwNhL606OLIp4rQEXKtQ58bOS4EcJYzxuiU1pVzQvUH2bfUIXDmYUoSZVCu2oV6+dm4JxyECp5rO0LqkIJLA07gxtOGm6/tLHu6rJL+YE0+DgG8ApGdV39t5j2xoHnCzNSZyeMlrq+Z1Hq7GXpiy6ChuUXSoS7LScRu3QlSjbc0Z5CKROv2ACHaM+czzgsyyAU2/NhWeaPs3o82Frt4WdUc+A/VqbSZi9/OGJls/N2JZSHXj9euj2gIkMDe/jzXF/kN0BkifSUQ4P3eXbrFUqwG05j2enBVSnRzRUtEJ9zIPtXcogqMtQN7dejwdYvstfjlsl8+Am8uT9oy8rfvnkPC8wcf8YjJ61p9mYg+HPWbx1AQXSzvgjFE0w4opy1HZ6f6hW2c47nuX6F0BriUW3R1wvHemLGacbznDdeTI1IRf6/eTv/thX76F3Ed6sQkR777QyWpaXSGE+z8S+NEwMwZQtSpyh0oyEu68qxRyZ943PVlvQjBmQ0U4FkodFjVatrHppVO9gtakCFtFrmgT9lrN44eN5wk6Rk6Q8c3BcjPbxdEoR3dXrTNx/8wksHSbbWm+YQiwCZrF0LEQtWS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhDYk96c29VTXNTSUVNVllZRERiWU9lTGNxNkxWMFIrS25odUJjMDkwQks2?=
 =?utf-8?B?SitBc0ZmcHMvVSs1UjhCbTJwazBHb1FjcEdEZHo1ZTgzWUxSSTU4eGhaYzlp?=
 =?utf-8?B?UFQ2MjhobjBCcmVQMmpzT1RtRGpCa2l3T1ZWcnd5azRhZmpZbXFUSG1pTVdO?=
 =?utf-8?B?d284c3dRaXg0S2NZVDBRVGNOTzZnU0NTOWFNSkxWSVRYVFZFUTJWZUx5QUxE?=
 =?utf-8?B?ZUwrUi9iQlRMdmhQcTZaelU5OWZ6Z0pnUHpMbUhYUzhBYkFlVUszSnZRUkFl?=
 =?utf-8?B?emV4VDdnTlQ5UER0SXF3QmhJbEN2V1kvWlg5SlQxaUJ5b0dZOXBIc2d5ZTdq?=
 =?utf-8?B?SWJVNTlDa1ZpQnkySys3MUIwNFRiNmo0L1FyZTFUeVdXL1R0U2xFTjhBQlBY?=
 =?utf-8?B?bXo1bXNvS1RzdnpFOGFldTZhQ3Zxd2xZWVNFOE1BemhlZ2VFd2cxUFh2RTZL?=
 =?utf-8?B?RkNnUk1yTEVTUTg1QWRpYkwwUnlhRTdvc1ZVVy9xUDVzS3BnSmpvckxWL2ty?=
 =?utf-8?B?T1kyZTNIL0ozUUhESnVTYlYrQWRSYWswYzBXWENBVWRNMWhoZUU1Ti9WZ1lV?=
 =?utf-8?B?VkdyaVpKM0pmek5ibEw0YityNmlCdEJORldqV0NtYTI5OHQyQWdrbndtZFZ1?=
 =?utf-8?B?clFUV1E2YnZienNRS0s3V3F3dUs5QmFtcEkzMkRMaDlwbUlxcWJjY0RKVVF4?=
 =?utf-8?B?eFZ5TVpCdG9BZ3JicHk4aXBueGFqZDdJVVNjUEk2NHFLNXJjMDY2dUJKeEU1?=
 =?utf-8?B?UnI3cUhKU2pVVnhRUmp0M0lmSlFOck1mdTN6a2xIOEVIWEtDMFE2L0VuL2tW?=
 =?utf-8?B?MVUyeU5adnVEREdYcDBGd0tjU2piOFltMElYSFA3bHVVd01RT3RrcWJuSFlz?=
 =?utf-8?B?bGtwSy80ajlIZllqOUl3SFliaUFFZnNoTVJGaDdoWkFBZUgvZUlaTWZjQ3da?=
 =?utf-8?B?cndyTGtTcWd5ZDVOdGFHeVBiN3RWNHU0NzcwUTZhaWhsL01DS3VCMkw3dFln?=
 =?utf-8?B?dm5Nci9JcmUwZkFCL3dGR015MkZkZTFjVWVtWElmTDBuZWIvN3l4Z3N5bmNS?=
 =?utf-8?B?VjZ6Zk8xelVEdjg2aVlDdm05ZC92L2lWSVBIZHRaT2dGaW1JS05hY0pNaW1Q?=
 =?utf-8?B?Y0J2UDRxRldDaVFHaWJ2UjJ1MUFyTU9xVWh2QzhLLzZMcGVSUVREbjFOUmRx?=
 =?utf-8?B?VFo0ZWVZWUhieUtjekdLT1E3SlBHckVZK1FOUVBZUDZJM2lFSlZ5NHNLM2k3?=
 =?utf-8?B?OUswSTh3RDI5RkR0dmQ3ZmJwYmVVZFlBT0JyZUhYRitNRTVraXVKaUJsWmdZ?=
 =?utf-8?B?R3BtMCtNSDZUT3ZUOWpqZ1ZMelZ6U2pMdlVrNStwTFA0eXRuakVPWlZPOXNj?=
 =?utf-8?B?R3BrTnY5ZCswNjlVeS9Ua1FOVXRlL1VXL2JsYlR5cW1hSlp4b0MxTkh0djhV?=
 =?utf-8?B?ejJtYWVZdFRZV0Z0aHM0SHgrTkhPQTQ2VTI0VW1rUHA0RG96cSswaDFYYXlR?=
 =?utf-8?B?WGhkMkM3UkhCb3gzYW1ZYzR0WjlRRmVudlRqU2ZTYVQ4dkR4SmZTN1VraW41?=
 =?utf-8?B?NWFvc09lSzlpQnBWcWszRDRKcU56amtnK1F1cExFUE11RGhJMUh2UlJ1Y3Va?=
 =?utf-8?B?bUgyTmwzQmhkOWY2NytFejh6WUNLdEVOSDdtcFcwWWFrakg3VURWRUg1VDFV?=
 =?utf-8?B?Y1ZWSWlvT2VuT01iSEgzNTY3MWJrbEU2aUdWQjFZc3ZBeVVoWDNGcm1EQUFm?=
 =?utf-8?B?Njd3T3pFQUlyaHB6bDQxaldZSFFuRmo3ZGExSit5Rm84ODU1bTdvWHZTbGFj?=
 =?utf-8?B?RWROY1dEVk83c3dXcHMzZFZ3dWRsbmRvOWR0c25sZjQ4NXNTMmZmYWMxejBL?=
 =?utf-8?B?dHM2V0w5RGRPaThLYUFKRCtkYzlZcFY0VXZ3Q2UwWWxkMDl1U05Dc2hqOEtm?=
 =?utf-8?B?MmhGaFlLYmsvSzhJb2tWeERnbXFqUFFJcWliMlFYWnIzSkhDMmo4dVRoaGQz?=
 =?utf-8?B?T2N4MTFhZlV3U0tWQTA5TVVMK3Yyd3h3aEtzMEFIS29WbCtMbWczL2RORW5p?=
 =?utf-8?B?M3RBQ0dCeW9vdGNncmhON3B6QTRSYmxWdjFBOEpyUFFzaVFybndFWHorK0k1?=
 =?utf-8?B?ekFSeEFsREtDY1VRNDltWElHSkloZHVtdHQ5UWZ1WjZuZ1B5aHdIbmhhNnpk?=
 =?utf-8?B?NzBScE1la3NkSmJHalM2SGFXbjdyZisyd1pPWFd5dGZuN2VyWlVtTW9LRkdK?=
 =?utf-8?B?QTljV1Q2bFJ0anVubjFsM0swNkMvc25kNjdWYk44RUlIbVZxQms3THRPbGcy?=
 =?utf-8?B?YkpBTkIvTnBhZXdaSWJUZ2xPbm5OU1MrbDFhSjl0SG9pc1FESXZVdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6351b656-5a9d-4269-52d5-08df3f1fc6ba
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:43:02.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBu5W4ichdR5Y1ByL2JbCtVRXdKnh+YjL7kJwHAD9S0yW2cc4ZQimBH6HVaJJ9dTuz3xgSKymyVYs8fbfG8NIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034312_881502_045CD08A 
X-CRM114-Status: GOOD (  20.93  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTHVjYXMsCgpPbiAxMS85LzIwMjYgMTE6NDMgUE0sIEx1Y2FzIFRhbnVyZSB3cm90ZToKPiBb
IEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiBGcmksIE5vdiA2LCAyMDI2IGF0IDM6MTbigK9BTSBD
aHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEtyenlzenRv
ZiwgTHVjYXMsCj4+Cj4+IE9uIDExLzUvMjAyNiA3OjU3IFBNLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gT24gVHVlLCBOb3YgMDMsIDIw
MjYgYXQgMDQ6Mzc6MTBQTSArMDAwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+Pj4+Cj4+Pj4gQXNz
aXN0ZWQtYnk6IExMTQo+Pj4KPj4+IERyb3AgdGhpcyBvbmUuCj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPj4+PiAtLS0KPj4+PiAgICAuLi4v
YmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbCAgICAgfCA1OSArKysrKysrKysr
KysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Ft
bG9naWMsbWVzb24tZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sCj4+Pj4gaW5kZXggZTc2OWM5YmI3MGQ4Li42
ZGUwMTNlM2U4ZjYgMTAwNjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwKPj4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+Pj4+
IEBAIC0yMyw2ICsyMyw3IEBAIHNlbGVjdDoKPj4+PiAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uLWd4YmItZHdtYWMKPj4+PiAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1kd21h
Ywo+Pj4+ICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+Pj4+ICsgICAg
ICAgICAgLSBhbWxvZ2ljLHQ3LWR3bWFjCj4+Pj4gICAgICByZXF1aXJlZDoKPj4+PiAgICAgICAg
LSBjb21wYXRpYmxlCj4+Pj4KPj4+PiBAQCAtNTcsNiArNTgsNTkgQEAgYWxsT2Y6Cj4+Pj4gICAg
ICAgICAgICAgICAgLSBjb25zdDogY2xraW4xCj4+Pj4gICAgICAgICAgICAgICAgLSBjb25zdDog
dGltaW5nLWFkanVzdG1lbnQKPj4+Pgo+Pj4+ICsgIC0gaWY6Cj4+Pj4gKyAgICAgIHByb3BlcnRp
ZXM6Cj4+Pj4gKyAgICAgICAgY29tcGF0aWJsZToKPj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+
Pj4+ICsgICAgICAgICAgICBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+Pj4+ICsgICAgdGhlbjoK
Pj4+PiArICAgICAgcHJvcGVydGllczoKPj4+PiArICAgICAgICBjbG9ja3M6Cj4+Pj4gKyAgICAg
ICAgICBpdGVtczoKPj4+PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBtYWluIGNs
b2NrCj4+Pj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEZpcnN0IHBhcmVudCBjbG9jayBv
ZiB0aGUgaW50ZXJuYWwgbXV4Cj4+Pj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IFNlY29u
ZCBwYXJlbnQgY2xvY2sgb2YgdGhlIGludGVybmFsIG11eAo+Pj4+ICsgICAgICAgICAgICAtIGRl
c2NyaXB0aW9uOgo+Pj4+ICsgICAgICAgICAgICAgICAgY2xvY2sgb2YgdGhlIHBpcGVsaW5lIHN0
YWdlIGluc2VydGVkIGluIHRoZSBidXMgcGF0aCBiZXR3ZWVuCj4+Pj4gKyAgICAgICAgICAgICAg
ICB0aGUgY29udHJvbGxlciBhbmQgdGhlIERSQU0uIFdpdGhvdXQgaXQsIHRoZSBjb250cm9sbGVy
IGNhbm5vdAo+Pj4+ICsgICAgICAgICAgICAgICAgY29tcGxldGUgRE1BIHRyYW5zZmVycy4KPj4+
PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoKPj4+PiArICAgICAgICAgICAgICAgIGNsb2Nr
IG9mIHRoZSByZWdpc3RlciBibG9jayBob2xkaW5nIFBSR19FVEgwIGFuZCBQUkdfRVRIMS4KPj4+
PiArICAgICAgICAgICAgICAgIFdpdGhvdXQgaXQsIHRoZSBibG9jayByZWFkcyBhcyB6ZXJvIGFu
ZCBpZ25vcmVzIHdyaXRlcy4KPj4+Cj4+PiBUaGlzIHNvdW5kcyBsaWtlIHlvdSB0YWtlIGNsb2Nr
IGZyb20gb3RoZXIgYmxvY2suIFRoYXQncyB3cm9uZywgdGhhdAo+Pj4gZGV2aWNlIHNob3VsZCB0
YWtlIGl0cyBvd24gY2xvY2suCj4+Cj4+IEkgc2VlIHRoYXQgdGhlIGNsb2NrIGluIHRoZSBkdHMg
cGF0Y2ggY29ycmVzcG9uZHMgdG8gPCZjbGtjX3BlcmlwaHMKPj4gQ0xLSURfU1lTX0VUSFBIWT4u
IFRoaXMgY2xvY2sgcHJvdmlkZXMgdGhlIHdvcmtpbmcgY2xvY2sgZm9yIHRoZSBBUEIgQnVzCj4+
IG9mIHRoZSBFVEggUEhZIGNvbnRyb2xsZXIsIGFuZCB0aGlzIGNsb2NrIHdpbGwgYWZmZWN0IHRo
ZSByZWdpc3Rlcgo+PiByZWFkaW5nIGFuZCB3cml0aW5nIG9mIHRoZSBFVEggUEhZIChpbmNsdWRp
bmcgdGhlIEVUSF9QTEwpLiBTZWUgc2VjdGlvbgo+PiAxNS4zLjQuMiBSZWdpc3RlckRlc2NyaXB0
aW9uIGluIEEzMTFEMiBEYXRhc2hlZXQgZm9yIGRldGFpbHMuCj4gCj4gVGhhbmtzLiBUaGF0IHNl
Y3Rpb24gaXMgdGhlIFBIWSBibG9jayBhdCAweGZlMDI4MDAwLCB0aGUgcmVnaW9uIG9mIHRoZQo+
IG1kaW8gbXVsdGlwbGV4ZXIgbm9kZS4gVGhlIHJlZ2lzdGVycyBpbiB0aGlzIGRlc2NyaXB0aW9u
IGFyZSBQUkdfRVRIMAo+IGFuZCBQUkdfRVRIMSBpbiBldGhfdG9wIGF0IDB4ZmUwMjQwMDAuIE9u
IHRoZSBWSU00IHRoZSBzYW1lIGdhdGUgZmVlZHMKPiB0aGVtIHRvbzogd2l0aCBpdCBvZmYgdGhl
eSByZWFkIGFzIHplcm8gYW5kIGlnbm9yZSB3cml0ZXMuIE15IGRhdGFzaGVldAo+IHJldmlzaW9u
cyBkbyBub3Qgc2F5IHdoaWNoIGNsb2NrIGZlZWRzIGV0aF90b3AuIENhbiB5b3UgY29uZmlybSBp
dCBpcwo+IHRoaXMgb25lPwoKVGhlIGluZm9ybWF0aW9uIEkgY2FuIGNvbmZpcm0gaXM6CiAgIC0g
VGhlIGJhc2UgYWRkcmVzcyBvZiBldGhfcGh5IGlzIDB4ZmUwMjgwMDAsIGFuZCBpdHMgY29ycmVz
cG9uZGluZyAKQVBCIGNsb2NrIGlzIDwmY2xrY19wZXJpcGhzIENMS0lEX1NZU19FVEhQSFk+Lgog
ICAtIFRoZSBiYXNlIGFkZHJlc3Mgb2YgZXRoX3RvcCBpcyAweGZlMDI0MDAwLCBhbmQgdGhlIGJh
c2UgYWRkcmVzcyBvZiAKZXRoX21hYyBpcyAweGZkYzAwMDAwOyB0aGVpciBjb3JyZXNwb25kaW5n
IEFQQiBjbG9jayBpcyA8JmNsa2NfcGVyaXBocyAKQ0xLSURfU1lTX0VUSD4uCgpUaGUgQ1BVIHJl
YWRzIGFuZCB3cml0ZXMgdGhlIHJlZ2lzdGVycyBvZiB0aGVzZSBwZXJpcGhlcmFsIGNvbnRyb2xs
ZXJzIAoob3IgUHJvY2Vzc2luZyBVbml0cykgdmlhIHRoZSBBUEIuIENvbnNlcXVlbnRseSwgdGhl
IHJlZ2lzdGVycyBvZiB0aGVzZSAKY29udHJvbGxlcnMgY2Fubm90IGJlIHJlYWQgYW5kIHdyaXR0
ZW4gcHJvcGVybHkgaWYgdGhlIGNvcnJlc3BvbmRpbmcgQVBCIApjbG9jayAoc3lzX2Nsay9jbGs4
MSkgaXMgbm90IGVuYWJsZWQuCgo+IAo+IFRoYW5rcywKPiBMdWNhcwo+IAo+Pgo+Pj4KPj4+Cj4+
Pj4gKwo+Pj4+ICsgICAgICAgIGNsb2NrLW5hbWVzOgo+Pj4+ICsgICAgICAgICAgaXRlbXM6Cj4+
Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+Pj4+ICsgICAgICAgICAgICAtIGNv
bnN0OiBjbGtpbjAKPj4+PiArICAgICAgICAgICAgLSBjb25zdDogY2xraW4xCj4+Pj4gKyAgICAg
ICAgICAgIC0gY29uc3Q6IHBpcGVsaW5lCj4+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHBjbGsK
Pj4+PiArCj4+Pj4gKyAgICAgICAgIyBUaGUgUEhZIGFkZHMgdGhlIDJucyBSR01JSSBkZWxheXMs
IHNlZSBldGhlcm5ldC1jb250cm9sbGVyLnlhbWwuCj4+Pj4gKyAgICAgICAgIyBUaGUgUlggZGVs
YXkgbGluZSBvZiB0aGlzIGdsdWUgaXMgZmluZSB0dW5pbmcgaW4gMjAwcHMgc3RlcHMsCj4+Pj4g
KyAgICAgICAgIyBhZGRlZCBvbiB0b3Agb2Ygd2hhdCBwaHktbW9kZSBkZXNjcmliZXMuIFRoZSBU
WCBzaWRlIGhhcyBubyBmaW5lCj4+Pj4gKyAgICAgICAgIyB0dW5pbmc6IGl0cyBvbmx5IHN0ZXAg
aXMgYSBxdWFydGVyIG9mIHRoZSBjbG9jayBwZXJpb2QsIHRoZSBmdWxsCj4+Pj4gKyAgICAgICAg
IyAybnMgYXQgMUdiaXQvcywgc28gdGhlIFRYIHByb3BlcnR5IGlzIG5vdCBhY2NlcHRlZC4KPj4+
PiArICAgICAgICB0eC1pbnRlcm5hbC1kZWxheS1wczogZmFsc2UKPj4+PiArCj4+Pj4gKyAgICAg
ICAgIyBEZXByZWNhdGVkOiBuZXcgU29DcyB1c2UgdGhlIHN0YW5kYXJkICotaW50ZXJuYWwtZGVs
YXktcHMKPj4+PiArICAgICAgICAjIHByb3BlcnRpZXMgaW5zdGVhZC4KPj4+PiArICAgICAgICBh
bWxvZ2ljLHR4LWRlbGF5LW5zOiBmYWxzZQo+Pj4+ICsgICAgICAgIGFtbG9naWMscngtZGVsYXkt
bnM6IGZhbHNlCj4+Pj4gKwo+Pj4+ICsgICMgRGVsYXkgZGVmaW5pdGlvbnMgZm9yIE1lc29uOGIg
YW5kIG5ld2VyCj4+Pj4gKyAgLSBpZjoKPj4+PiArICAgICAgcHJvcGVydGllczoKPj4+PiArICAg
ICAgICBjb21wYXRpYmxlOgo+Pj4+ICsgICAgICAgICAgY29udGFpbnM6Cj4+Pj4gKyAgICAgICAg
ICAgIGVudW06Cj4+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOGItZHdtYWMKPj4+
PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244bTItZHdtYWMKPj4+PiArICAgICAgICAg
ICAgICAtIGFtbG9naWMsbWVzb24tZ3hiYi1kd21hYwo+Pj4+ICsgICAgICAgICAgICAgIC0gYW1s
b2dpYyxtZXNvbi1heGctZHdtYWMKPj4+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
ZzEyYS1kd21hYwo+Pj4+ICsgICAgdGhlbjoKPj4+PiArICAgICAgcHJvcGVydGllczoKPj4+PiAg
ICAgICAgICAgIGFtbG9naWMsdHgtZGVsYXktbnM6Cj4+Pj4gICAgICAgICAgICAgIGVudW06IFsw
LCAyLCA0LCA2XQo+Pj4+ICAgICAgICAgICAgICBkZWZhdWx0OiAyCj4+Pj4gQEAgLTEwNiw2ICsx
NjAsNyBAQCBhbGxPZjoKPj4+PiAgICAgICAgICAgICAgY29udGFpbnM6Cj4+Pj4gICAgICAgICAg
ICAgICAgZW51bToKPj4+PiAgICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLWR3
bWFjCj4+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLHQ3LWR3bWFjCj4+Pj4gICAgICAgIHRo
ZW46Cj4+Pj4gICAgICAgICAgcHJvcGVydGllczoKPj4+PiAgICAgICAgICAgIHJ4LWludGVybmFs
LWRlbGF5LXBzOgo+Pj4+IEBAIC0xNDIsNiArMTk3LDEwIEBAIHByb3BlcnRpZXM6Cj4+Pj4gICAg
ICAgICAgLSBpdGVtczoKPj4+PiAgICAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjYt
ZHdtYWMKPj4+PiAgICAgICAgICAgICAgLSBjb25zdDogc25wcyxkd21hYwo+Pj4+ICsgICAgICAt
IGl0ZW1zOgo+Pj4+ICsgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+Pj4+ICsg
ICAgICAgICAgLSBjb25zdDogc25wcyxkd21hYy01LjEwYQo+Pj4+ICsgICAgICAgICAgLSBjb25z
dDogc25wcyxkd21hYwo+Pj4KPj4+IEkgc2VlIG5vIHN1Y2ggaHVuayBpbiB0aGUgY29kZSwgc28g
bm90IHN1cmUgaG93IHRvIHJldmlldyB0aGlzLgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IEty
enlzenRvZgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4+Cj4+IC0tCj4+IEJlc3QgcmVnYXJkcywKPj4g
Q2h1YW4KPj4KCi0tIApCZXN0IHJlZ2FyZHMsCkNodWFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
