Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00C606A31E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 02:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4mcbe/B8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=dUBpsHXO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dn6UcvOGuacumszN3Fchrs+nTkueqMkUS3vaST+QdRc=; b=4mcbe/B8JlCn1n+qLLEWkKZp5N
	XUa3rS87G5cASVkS1TUnG29dtfYw52nUYmiZI5ooH7pBJjJBG7BCg0BMNoPwBn4jj/pIXHJJDJFpO
	c8+f2kMEGfJ2kM/sYBRcsqHAUVyQOevbEkVEc4UyoHd3+r6381eQ2462qYEXXRyRHbYP/lVdKytbw
	UWcZ4OZ5HXLeUfRim5OZ/XN3ksPed6qOTwRiK5ts/pc6gqpMX39t3hecPsRz9JeXbwJ6DdhoKCHvu
	g8M2AzwAf/H5Wh/VvjqBZQ99eF8Tnrzqa0POlpMplRFkoNRcMn7eU/En3wLGH0VWw+urymJ9DdDeO
	kpYtUaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAhH-00000001cv4-07Vo;
	Mon, 26 Oct 2026 02:44:27 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAhE-00000001cth-0Uaa
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 02:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpgL2410PKLsbUw5xkVaQQ9zvKdx4nl42LZetY0L4CDHgcRxBhTVVSQxV/nAl9xswzhSn6lQ5euyXQB+lDzUiUlGgufCwniN6UfFgPteqlhzCNfjhN9UGw+dmomz9RJ1eIbH+DOIlEuqj7Bu0HEFRv+ENBf4G/YbFCBMlUgeje6ksbc4cZwXwp3okZNtpZdAiVBKxp9hVDVGeFUGQ6yu0EtapOzc0nHo24St1qrgD/w8PFdkA+ABjtY+cPHH6bivyy3KdcjXGR4REhiSQZzFoopAKEBTzfKrfCTqWmv7HQthN0AjemqGBcZuiT8fnK1585/11EhmGUTWmRQ+Qxy3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPhloVl2rCT9rp4t8MgGVUqgOZ2H0S/gwLs4NaoNu0c=;
 b=HvlHrhDK1uxSw/FPDyaSdPxrE1D2kHy5QwFEMCTqWm5sZOhVH+R34XIylEGOoonJITBM6Nq3n5r/ANHo873meuYk/kdCSTBNKQ3QysgSzue0GsTvYVZGNEUfeBj0xL0cDFa7msmR8ekjO9rJGkz4g3uYM7iCaWDWgaE4lXZJbshs6PAGP0m+/pN+9s91leDotp4EDwnTgC8Z3bmB16tyEMfJeu6bfYFwinGe+BgkaVhw0OUV/mqSkjC28YCOdbMnHXxzGjxtnOCiCmjXamOrNzlY0njSsO2s7clX/1siQRRMZJw+8+0sRsGPO5A0u2c2Eu9X3DhlOhECmffw8XOaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPhloVl2rCT9rp4t8MgGVUqgOZ2H0S/gwLs4NaoNu0c=;
 b=dUBpsHXOLdxkZnwHOg9kvHGnTGDwVVOhxf/I6alQqn0XhUwKbsqGguxlMUZtuaD0L9VlFIRV9E9DnWrcHgvX4RHsOzeBFIqu+JasPZxVq+/SAGNXNU1ZUI9GWNM8mHVt3qqLX0l6tCQR4CzNXhwR74vNJSjkuS4CXH77wIJhoskr/8b5+L4gDLrkdF1fgspbEqNjP359rvzYX2oq0edLL70jTQo9/fbxMpEQHCFBA/ZBtl97XSWhPPTC3e0rroS0RKrOJjxzTlcgj9qZrgHQgnDAiCmswFs/ycHK/fMOgqO8CzO/0VXFD3YzeDv0p/0FNsDRQheTWtdnJuRornLB7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8143.apcprd03.prod.outlook.com (2603:1096:820:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 02:44:21 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 02:44:21 +0000
Message-ID: <6a0c24db-ef9b-4c24-8863-558b59f422d8@amlogic.com>
Date: Mon, 26 Oct 2026 10:44:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: amlogic: Fix an error handling path in
 aml_dma_probe()
Content-Language: en-US
To: Frank Li <Frank.li@oss.nxp.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org
References: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
 <atvH1ZOrSbsGwncP@lizhi-Precision-Tower-5810>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <atvH1ZOrSbsGwncP@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: JH0PR03CA0039.apcprd03.prod.outlook.com
 (2603:1096:990:74::29) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fcae7f-ee6e-4e12-9ae2-08df330b09b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: O7gWsyx2S0BAVKA+6Gt7iOQ3VEot6MZbYxHkhSkM07TGGoaz/muT1B0qS457X2eO61VjqSmJbMcfqJc9vwCrE/CYxPjvGfdvC8cB3os9nUy6Jje+lin6gJ+Wc2zfZKca+dFKGWFLypgTChBbu11rZHWJrqm3AakiQg00PzKQB1rtSUYI0pQ5PV15RM+okL0k9LOxa/0N9i6NQuN7ScnO6G0dOSHmWTICeGki+/0jLgu9wKvTHyvktkQkxx3K4yh29udoe/5oOeushJDehb+jqF+47xzlzicmuPZ9h7hBCvURULOzLBxZyREC65LWX+UQ5HXj+x0z6fT3g7Tpv45zQs7Y8ZxGnGMxdn5JKDmdWaJFXhBvQHhfP0DOI4dZaJxrFQN+GgtIwrf24Hn5bZzu1DAVvNTeuyKUfyIe+TI05gJSkyZesQg73AfjsTRFTX0qOnVc67pGQleNDbE1xDsVrpw0bjQWuzNjrFvG9oVM4ZUrk1yb/1CgmAeltnkBvU9ayMgwz7/30M4F/3hHNzblOmoYPNebJA+I/NVNv4pLS2C1AIDL4E2hpvCJLmAIIY9TvwtNyAygAjJdDo7KqUnV7ZX2zVKsAYifoX5tLbcwN7Wj3kvnVpYr9VpE+M2FsbyMxES8Q6/zgs5gihJ11STDDtYclEVWC3QfoDqLcfh4jmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1R0OC8xZHFhcFUvWGRORFVDTDBvaWRtSGZlMHhWT3BzSVNBbXJ2WDdBOGRR?=
 =?utf-8?B?dTVPeHNkWVM2VTBnUE9nckZ0cjNjSDYzdzhqT2VTRGU3TDQ4Vktrd21idldq?=
 =?utf-8?B?Y2F5dlJjTGpyd3g1THNNaUJSaEZGY1JKZFFrZXhNNkpROGd4MjFjeGdDcm1w?=
 =?utf-8?B?Zm9tQ3hWYzdmaUc0UEM2NHBlbGpWMmQ2a29nSExHVldwZnpsRm5sUFZpYUJI?=
 =?utf-8?B?bEI1enAxTUptcUdiVGlReDlrUXNQQ05YalB4d0RJN0FpNGxlUTcvbFQzWEps?=
 =?utf-8?B?aXB0Lzh5djB4VEwrL09MTFRxN1lrdlBPby9HUFFBb29Xci9sTnNOMmYvaEtF?=
 =?utf-8?B?V2ZZbE52OTRob214RUp4YjB6YTkvUmlJam0zQnNPMDRMSEVXYkhrNGpJV2pG?=
 =?utf-8?B?cVMxWjgxaWZzbUM5NW16QzEza1JGY1NEQU9SMUYrOWxtNmtuK0JyMHhvS25t?=
 =?utf-8?B?TEN6L0NndTkwVElyT1BGdWM4bmxjUWlmSDZybmNHNWJtOGppYTlLajBZam9X?=
 =?utf-8?B?RC9iQ3dTTUVpbEF0UDNRT0MvaG9QOGlKeHZBRDVzRGhuRmJOUk9OS3JteGor?=
 =?utf-8?B?M3lQMmlPbkRyakZNWkRDSTJKVWk3cmxOVXpSUVZVcGNVNVcwT2tzbUNPVk1y?=
 =?utf-8?B?bVJGZ0g5T3dqOEhscXY0Z2N1SHlxRG1XTnhQTHBOcEFDNnJRZGQrVG1NbFA5?=
 =?utf-8?B?T0wyakdTRHVocDdwbnZnUXppQW9xSmx1VE96WXdHMVZ1V2g0YVVIWHhpbDJB?=
 =?utf-8?B?bENCemt1U1d2UEhuV3FpRkxVYzJuSXJqTERaSFJWbWVBUVZLaUJJWWY0ZVJL?=
 =?utf-8?B?dnhjanBTZmY0MEVkcU1LL0ZHb1RtNSszVndqU0hOd0Q2U3FiUXZGSkgrZUtQ?=
 =?utf-8?B?bkRVbURJTlJ6ZlA1NnBFTC80aTlmUnZZR2s1OHRjV3g1YlJnS29MMlV1MUdI?=
 =?utf-8?B?VVdtRXlNcW5YNi85eXMydFhRWFN5WkhpU3Y3TUxPdThPQ1AvclhkaDRMbXNq?=
 =?utf-8?B?UDlaMXlSNFRqVCs1SXVRQmcxbGNtUUl1UnEwcS8vRU9Ob0JZMzlNNUk1YkFP?=
 =?utf-8?B?UlY2S29MNUEwaGcrYVVXcGM4R1k1U0o1NjVtWnZzLzU5b29XVGp3dUJ6WkFD?=
 =?utf-8?B?WElJT3JGNkJEUVc2Y3NyNmJwNEFLVXdUS05SQm5DcjNlTy9MaTBWWXdtaGZU?=
 =?utf-8?B?N2Izalc3K1ArcTV5eWRjcnIrc25OcldEYXV2K1NEa2tOK1Urd1hMSjFjMUI4?=
 =?utf-8?B?QmNEeFF6eDN5TjdJemJKVjRYR0R2aWJuSCtEYnJjTS96aW5vd2Y3SURIcEY5?=
 =?utf-8?B?c3lPMDVrSjlCMXlMZEZWSWRFMTJ2bTBESmJvNDBwa1hDaDRxWngvRDlaQ0J2?=
 =?utf-8?B?SFVycDFSemRDTkxHNDZiZjdPZ1ltdXQ2V2psZGM4ZVpIeUdiS3BwRS96VUpR?=
 =?utf-8?B?UkZ1U0JHMEJNN1IwS3lGcnRDMmlmeGlyVVlCMlZzZkZ5RGtvQkY3Q3hWcVRq?=
 =?utf-8?B?OHZQdGZta3lFRE9YeUpIeldUTDU1NmJ3dythZ0pMU1lGeFhyOVhya01ncWlK?=
 =?utf-8?B?cjhyenlrTm1Yd0prelJ5dVd1elZrcm01SmNhMG5SUWpQU1E3Y2RockduSy8v?=
 =?utf-8?B?RTlPSW1XOVJvMVpQYW9wRlZkQnFJalVKT091eUd2dTFVL1hYV1RIcSswTFdp?=
 =?utf-8?B?ZnJUZGc2QisrT0tXczZBQWMxOHZMeGVTZU95Q2lUSGFaOVoxV2pPZGN6SkpB?=
 =?utf-8?B?cUNCMnpHSCtKTndmUUpIaU5aVTNFUVliRW9zWnFhVW5oSldiakNOZm5MS2No?=
 =?utf-8?B?Q1lDSm05Z2RrM3g0VWlCUGtVdUpEd3NQQThXUUtoOFVWaVZnM2lnemtEY1Zj?=
 =?utf-8?B?cDJLckU5c1pqL0FqWWJqdjZEV2xHVFJ5cHJLWG9MMnRNNHVRVDZKSU5wQkhL?=
 =?utf-8?B?MThuTGJLd1lOZ252N2FvazNoR01tZkU2bkM1akI3OXBJcnhhVStEVXYwVlNi?=
 =?utf-8?B?aXQ3ZEJkM1hLZmpxeGpKWUF6Y2FpbkhxT0t3K1Rac0pnSmhPN2pWTUZGRW1M?=
 =?utf-8?B?QkM3RDF5cklGMTRUTEREb3duYVV1YUwwOS85OTVQc3dSS3dsSnlGWTBUM3Ri?=
 =?utf-8?B?VlE3SWJOUlo1bEloTFoxOEY0KzMrRmxTMkNuUWtWcWM0bEcxSXZpcWo0TVdV?=
 =?utf-8?B?WTBHSGdlMHZreG8ybUtXMUFONHNEWjMzVW9iU0JGUmxQN0FiV3BsR05jQ3lD?=
 =?utf-8?B?cmRSc2hpTkNJMEx6dHhxRWRlSHA4ZzhhY3c1ZGVGajZuZXdrMWc1ZzBTbHN5?=
 =?utf-8?B?bkdGMjk4UkpDQ3QrRjkwbno4R0Jjazl3Q2VVcEpCbjg0ejdNTjhHUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fcae7f-ee6e-4e12-9ae2-08df330b09b3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 02:44:21.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXGVX/IlIaflhGTt4v3Mg8P5DDM+DRUxvfXcZklfwhW8s0k7ONOW50lxYnocjP6HN8xzP21PRQFPjpO8zJIY4hggmmwu/lPFRWdOxSD23pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_194424_163824_AC6497AF 
X-CRM114-Status: UNSURE (   3.79  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,
    Thanks for your review.

On 2026/10/24 04:47, Frank Li wrote:
> subject:
> 
> dmaengine: amlogic: fix missing destroy_workqueue() at error path in aml_dma_probe()
> 

Will do.

> Frank

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
