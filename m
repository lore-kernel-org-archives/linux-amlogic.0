Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6FE606A31C
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DqPU1+h5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=V23ca8px;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=lO0RRqbx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zu4W2DdFnamKRhQi3XLkfHg/NKCllolGd+gMBFikel4=; b=DqPU1+h5d+N4NAQW8KOc6KMwzs
	d2rQGX4HMq0ePYVvA22cIN0w92Y04P1s3HB7+Zp7Hu1xNdEyF2HZSR7y7Y832kfc8hWCeuNjWo43Y
	X1bAfcooEe4cQGIkm8QZk9JZ4rwEgH58fgQe+uPisx/D60Tb1kenPBPwjzJvosRAoUjBjNuKUm7et
	OIxpogmCABp+K5ZKntZ5SiylWbU2gnnpqBaAp3PgAvl1IQ7kEI1qV/HJdJ4ZDWy+2fHMaU4z2Nl0U
	WJc9NIDObE/ujabdBXtRWWZKcixfs3AcrW82BZoRrxKA+uTNIdvUtJhzAyF0mwKwggjFg1guuNCi7
	yzvoR2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRcy-0000000BKtF-1ATy;
	Wed, 21 Oct 2026 08:24:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRcw-0000000BKrh-3s2f;
	Wed, 21 Oct 2026 08:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u4X22pOlQx5Bgxq3jw6Ct6xdBht+f0DBK+2jqPgnbaw=; b=V23ca8px8a19qyg5MCH8wj0QuL
	fEnpl25bS4p3yiAQSTrYIqqukVjzpKaoYSQzvtMjUnreh86YoEXNd9lqrhf3+2QebDK49+9nf219e
	DrRFA5LtM7/4CAkoVqnQFQpd5IZfLoAMxtGpFWx/F0f4qzd3M8rlOCanp8W+8QNS+i562hfMhVUMn
	XJJWmYNVSGgQjV/uLT1+2qEhUMVZvNf19wz+tKLFSI5ECUybFLlak4LLq59oSrcokdQ2fpxOcMDnC
	t9nNLA7Ay5JLnBYo/po7W3C1Kl7E66kIgi6SK7P6EMSrINyaVACP8RxkbjuPPpQEBSEd30/R+NNUo
	z6Y6LzZQ==;
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRcp-00000005ad2-3Z3m;
	Wed, 21 Oct 2026 08:24:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ku2huw1pnw41IJcVbIr9qbHu2vI0Ht+gbARF0kWiJTxY6xh377Tkj8AU1iUCiQ455930Sp4Lj8+CaGxCePdmgc97xzQP76G8yvAtp0fIf8n/eVkRWCIcCqou1YJToNa2Z7WglEAwl1UpgmsGaw0EWYUuQqh/ew/fF954lbkqMwA9Uw9W3FPXa/W2q7hqPHTKvFGZNFP7sebZcAVzd6tJ0QjkCrElr77N1dWKIQAMGYu23y+/aga2F8s6S90WRmm4yYS7RAB3GLHWZeCs3MCMB7o+CuKpf5ZH6pVMfsy1gpjRs+pjZv07u9PngKBLTS4IxtxyF7KWAQoRlTPE1VtgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4X22pOlQx5Bgxq3jw6Ct6xdBht+f0DBK+2jqPgnbaw=;
 b=GD5S/m6fgYhKVN0lrEYBF9QekN9oky1aFsJ3wX4gbxtFL3oZnGKuz8ngWZ7nuGJeddxHMl5fWklkOmM7+ZokVkoYtCyxjXJgv0uiMNsItZtRSvbjeYulSkvOdvbd3CZgbDKdWxn2PQUW1VU1CavelDgu9JZo6hJaSg/yH6ScTYuTxTCMhKiGazlQL8ldeJiPTdFvYyewXtxDPQrkLo29DRkfVUo9H2zK0HBVbXlMLvBvR283IaFkvD1wdd9SzBDGOsFmwdPXx+P9W4E0gU70+EwPgVmUTib5m5QJ3EzoT9vhOfj1hfIny8Sa16fFWYvX06OzTTzYSmWqP6k0kIYJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4X22pOlQx5Bgxq3jw6Ct6xdBht+f0DBK+2jqPgnbaw=;
 b=lO0RRqbx4jtdkbciUrrxODYLQLzoEoNKlDSSnQhv3u6rDG8Zi90uPRP9lJG5ESpT+YeSDJFdHCg1V1jIXgpzRrNSWXBEFstFjSF5jDdgQ++u93SBN6c92Nae4f+WfbbBkMUCrNNLGRZaeYO18SIfHgNUZU8MugjcwkvUez/U0ViyQi4Q6ImCUSZVbCZQV013TiXlf/E4ROac1q1oR8cCj0Le8v3WxzNHciZUymXP7Ve9rYuUN0u8/SVptET4Fzstx7w1Wbu4LR5jnngWM0d4SqsJ1f9WkY4oEvFiLaCmB8RgVnr4uqmM3AD50tjXYTQXsUEVu7TJM9ybscpV12QhQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SI4PR03MB10101.apcprd03.prod.outlook.com (2603:1096:4:2b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:24:24 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:24:23 +0000
Message-ID: <55844de7-efa2-42b1-8d5e-94e826ee27fb@amlogic.com>
Date: Wed, 21 Oct 2026 16:24:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock
 failures
To: John O'Callaghan <johnocallaghan@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
 <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
 <20261021060005.2947837-1-johnocallaghan@gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261021060005.2947837-1-johnocallaghan@gmail.com>
X-ClientProxiedBy: JH0PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::17) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SI4PR03MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e30c47-bb1f-463c-c891-08df2f4cb67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|56012099006|260925021311599003|260925022911599003|260925021911599003|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bCsWt5lWfpT1PKMb/lbjIQbBesOdPMGl7bsmIoxPIKl66GdaqCgfnyOBIoe0L12PzvA4ILi106aHITXVxBQnXf8e4dfkmPEImGvt6lmQgbTxAOJAHLkZWdPKxBhimSueFzq2Xs2ZSFTwDYGNmkBW9KsDhKQjDxxomlMc2Bs0CohnmDlasgUrxnlUJBP5bcmxVWX96yUnIILGnhIU79psqScdO5Bpyb7uVPhKt0KC4jSASkIRdXu96NRi9gvIsN73Ng1CR/akqWe+WKmsmx0Zk6szciK67txkIFVH+khOvhDiHkShW6bCbSgz+/6x0X1J1gRJn/dwOcXVk7tQu3WYKg7yl95uXnFrl4cVov3CBMuLQ8PJHMdGVP53EfUQ5Zsv0nId+jxz8sgzqMC/Q4XzKySqHRlEfoLzNh3V6M0S3pFKyCXJhwKnheaLW9E9IdhJHx3g/FvgRGPAL+LpPbW+dpY79X7BRqLUiPAo+BeNk7yp4Ld9SPD+lZp672lTebG1M/6DNIFLkMfeLtvljqgwZr4pPmMuRhgyOEZfFC4pDmzQV7f8tWIPHSgayuEUQv7CA8HR505VXVVCNEJCxhQDdL5NGgBCeKqfurhfwGG4b+nU6ZismrxCptZlhdvOBxaVbalg+PqUc6SqoR8NJDLq3pEl+a2qnPcPeZUmriLT1hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUxxeU9qNXl1MlhVQWtOWVM0SnpJRkFxZjA1UmlTM2VIZStIYldjRWxyNngy?=
 =?utf-8?B?aVRVN05QZGxzano3bjRoMHA1NXFQNys1UDZiL3B1K1QwMit5SE9pejNReVVD?=
 =?utf-8?B?TTZGRDhoS2h5dU8vKythdk1ud1BVd25pdzJYTVdpT1ZhN0IyRDlYYTl4N2s1?=
 =?utf-8?B?VStmT1NyVzYwSFdCSlJqVThRc0hxOTBCeHZ1WXJRQitvWjR6YTMwWUMzdk9W?=
 =?utf-8?B?eUorQUNXelBRTE9kV1NReVFSa0VsWlo3enduL1V3V3BYQzlOODNyTmxWeVl5?=
 =?utf-8?B?MjJBZjFNK1FWNWVDYjBhME9yUVpUQzN5MDd6TEwxenk5K3RYc0gvTWU0czV0?=
 =?utf-8?B?NVVrQStWVnpBdSt2OFI5VVRFREgyYk1tdzFjdEhnVllmd05GUXZOZ1RMN1li?=
 =?utf-8?B?MmlyM3JaclNXYVJ6UlI1eks2VFFRdCsxZUd4Wk1wQ0d0T3Q1bGJjdVBuWVgy?=
 =?utf-8?B?VUFZRDFudVloRWh6cUpqSVJsL3BQdVdZOGNMWFc4cVp5TWlzUlhGOFJXREpC?=
 =?utf-8?B?TmltL2VhaWNMWGNOOUNPUkxId3YyL3ZmdXNNQWRqY1VGaWlLQ0tHVXF6MnBz?=
 =?utf-8?B?a3cvdXo4SFV0VWFuam5MT2xXM1g0dFdURlFxc2ZyaUtxNjRZNkUvelRiSDE5?=
 =?utf-8?B?djBqaEpsUXpPblFlVzZkZzNHME9KdFBrVldKbTdoWW5wVTk2cVRIVWhKb2RX?=
 =?utf-8?B?eGVrZ1phVmE4dGhldXJrRHZkTDFUcEFaYW9MZWphb1RYSjVkMkM1NDlQa0NY?=
 =?utf-8?B?dTJoNElXR2V2aU1rd2Y5cXZyVHdIZ2xJYmpqMnUvRHRYQVBJQm9rUlBUSmM0?=
 =?utf-8?B?UUMraFNwWHJsN3RDM2lHUUhOSXJ5Tm1YTTdtR3JUbVNJdVpXUkFva2hNWTFH?=
 =?utf-8?B?NlZab3VBY214RmtVbGk3aThlbEhyc0ltNlIrQlhuaXFIY0psaG16bDFjUlVB?=
 =?utf-8?B?TmtsNER2WXpaWTY2R3FjZUt3SmZhR01uU2JUcnZUVzF2YjgvL01IYi92RzJD?=
 =?utf-8?B?NjN5YXphR2thalo0bjh5M0JBTFJzWHRkVmZkVEUvRGg5akZEVjMyYStnYnhQ?=
 =?utf-8?B?Uko1MUZlbTdDUjN5MzN1MHpMdnJOa0h5NUd5OHJSeDRoV0VDaTNabmNrRjZG?=
 =?utf-8?B?WXFLSFc2WXNNeENodmVxanhmbHNvbW0rSVlrYjM1OXNzWGNITEpqMFJ6NU56?=
 =?utf-8?B?ZDV0eG1DWFZ3a0h3VHRjblgvM3Q0Mi9nMDNkUXRIb2M4TXhsSzZVRGN5V2hr?=
 =?utf-8?B?citRZnY4WlJSR2kwRVRLVVdOak55Q3Bpays1b2RmL3R5ZEY2azlCSXdmc01Y?=
 =?utf-8?B?L1ZoTitPZmc1WVdsN3Q1MS9QdlpIcmhxRm9sK2dnTTdCYzlOZEoweHVNV2wr?=
 =?utf-8?B?djBieW1CZFRHUWMvaTlaV2k1YmJTNzM1MU5nb1F3blBFWFd0TkFLT2lyUkVl?=
 =?utf-8?B?b3ZmalpzdlJaUWhGdlFsZlBSQ3pOeXh3d1lPb0VIanRNbEw5bTVDdmNkV3l2?=
 =?utf-8?B?UUUxaWtZT0tPc1BXck5hbDR5U0ZRL1JmTW1CVGV5NlJIS28yYnZyV2luSmpm?=
 =?utf-8?B?Yk5zZUxkRWQyQ2ZVb2F1ZkNmS3F2UitVWEFDY1BPdGRuTVJWL3F0alJpcWpZ?=
 =?utf-8?B?QkwrVEduUlBCTW5ZR3JVb25qYVg0NEc4eStxZE95RlFnS1BhQWRIL0pnOWsz?=
 =?utf-8?B?bFZGNmh3Q21jb29RZk1jTVlWekZ5ZmFnWFpNWjd5K3ErTklZb1I1SmRWTkU0?=
 =?utf-8?B?c1hlQng5SUxPd1g1ak1WS3c3cWd4MVdFMXB0TERtZ2NFZE9NVGgvMG1Od1ZJ?=
 =?utf-8?B?ME53dE5mb0Fia0tyRE1sTVF4YXk2a1FvVFFXMEFZZW15MXpmWHZRdHNHSitU?=
 =?utf-8?B?bEhoS05pYWlHMDZscndoeU4ySDdsZE1CUHNmRURuQTR1NkxLcnlxaFJGRTNH?=
 =?utf-8?B?dkFrK1h4UzBSWnJacmhWYjgyNmF2L3g1UllSbEF4NUx4VUd4cTBKQ25EekRp?=
 =?utf-8?B?Z0hhY2tONm56Nkx2Nmd6cWlVQWpXRVVmRVBtcnp6blI5Y1I4aDZicTlMQVhR?=
 =?utf-8?B?Znl3a1lvVmRnYWV2cktGeWNHR2VCcXpPU1g5cFd5TG9ReXdsRlEvU2ttb1Rz?=
 =?utf-8?B?TUlHcms5eGxjZzUyOWdnSEJQaTlTS0dpY05hUStnUFp5T3F4akhEdGtFWEFD?=
 =?utf-8?B?a1BNa0xxTlhYT0h1eDhaSVk4V002YW5jTFltU2hmWHRMZHgvU256SDN4bVA0?=
 =?utf-8?B?L0w1Yjl4Vi8xSmhaTitMcVhpZkx5MWtkOWgyTmRFWkJxTTlZcDh2YnZyZVV3?=
 =?utf-8?B?WkhjbS9tdmhFaWFrZmlEOEJ0blViSXRsRDAwTmhmN2w0Qjg0aUVYUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e30c47-bb1f-463c-c891-08df2f4cb67a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:24:23.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQYB4ylB1r6XjfIBmCrzjTlDjQD9mMGBFNRi8V9ss0WEoExcquumEjWODM1IV9P2NEK/vlvoeD11+9QYgE5Pbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB10101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_092447_417664_51885ED4 
X-CRM114-Status: GOOD (  18.07  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSm9obiwKICAgVGhhbmtzIGZvciB5b3VyIHRlc3RpbmcgYW5kIGZlZWRiYWNrLgoKT24gMTAv
MjEvMjAyNiAxOjU5IFBNLCBKb2huIE8nQ2FsbGFnaGFuIHdyb3RlOgo+IFvkvaDpgJrluLjkuI3k
vJrmlLbliLDmnaXoh6ogam9obm9jYWxsYWdoYW5AZ21haWwuY29tIOeahOeUteWtkOmCruS7tuOA
guivt+iuv+mXriBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb27v
vIzku6Xkuobop6Pov5nkuIDngrnkuLrku4DkuYjlvojph43opoFdCj4gCj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gSGkgQ2h1YW4sCj4gCj4gSmVyb21lIGFza2VkIHdoYXQgd2FzIHRlc3RlZDsg
aGVyZSBpcyBhIEcxMkEgZGF0YSBwb2ludC4KPiAKPiBPbiBhIFJhZHhhIFplcm8gKFM5MDVZMiwg
RzEyQSkgcnVubmluZyB2Ny4zLCBzeXNfcGxsX2RjbyBvY2Nhc2lvbmFsbHkKPiBmYWlscyB0byBs
b2NrIG9uIGNwdWZyZXEgdHJhbnNpdGlvbnMsIGF0IHJvb20gdGVtcGVyYXR1cmU6Cj4gCj4gICAg
bWVzb25fY2xrX3BsbF9zZXRfcmF0ZTogcGxsIHN5c19wbGxfZGNvIGRpZG4ndCBsb2NrLCB0cnlp
bmcgdG8gc2V0IG9sZCByYXRlIDYwMDAwMDAwMDAKPiAKPiBJdCBoYXBwZW5zIHdpdGggYWxsIHRo
ZSBzeXNfcGxsIE9QUHMgKG9sZCBEQ08gcmF0ZXMgMzIxNiwgMzQwOCwgMzYwMCwKPiA0ODAwLCA1
NTkyIGFuZCA2MDAwIE1IeikgYnV0LCBoZXJlLCBvbmx5IHdoaWxlIHRoZSB2aWRlbyBkZWNvZGVy
IGlzCj4gYnVzeS4gCgpJIHVuZGVyc3RhbmQgdGhlcmUgc2hvdWxkIGJlIG5vIGRpcmVjdCBjb25u
ZWN0aW9uIGJldHdlZW4gdGhlIHZpZGVvIApkZWNvZGVyIGFuZCBzeXNfcGxsIGxvY2sgZmFpbHVy
ZS4gUGVyaGFwcyBpdCdzIGR1ZSB0byBpbmNyZWFzZWQgcG93ZXIgCmNvbnN1bXB0aW9uIHdoZW4g
dGhlIHZpZGVvIGRlY29kZXIgaXMgYWN0aXZlLCBjYXVzaW5nIGhpZ2hlciBwb3dlciAKc3VwcGx5
IHJpcHBsZT8gSGF2ZSB5b3UgY29uZHVjdGVkIGNvbXBhcmF0aXZlIHRlc3RzIG9uIHRoZSByaXBw
bGUgCmNvbmRpdGlvbnMgb2YgdmFyaW91cyBwb3dlciByYWlscyBhZnRlciBlbmFibGluZyB0aGUg
dmlkZW8gZGVjb2RlciwgCmVzcGVjaWFsbHkgVkREQU9fMVY4ICh3aGljaCBzdXBwbGllcyBwb3dl
ciB0byB0aGUgUExMKT8KClRoZSBvcGVyYXRpb24gb2YgdGhlIHZpZGVvIGRlY29kZXIgbWF5IGFs
c28gY2F1c2UgbW9yZSBmcmVxdWVudCBsb2FkIApjaGFuZ2VzLCBsZWFkaW5nIHRoZSBzeXNfcGxs
IHRvIHJlLWxvY2sgZnJlcXVlbnRseSBhbmQgdGh1cyBpbmNyZWFzaW5nIAp0aGUgcHJvYmFiaWxp
dHkgb2YgUExMIGxvY2sgZmFpbHVyZS4KClJlcHJvZHVjZXI6IHRoZSB1c2Vyc3BhY2UgZ292ZXJu
b3IsIHJhbmRvbSB3cml0ZXMgb2YgdGhlCj4gMTIwMC0xODAwIE1IeiBPUFBzIHRvIHNjYWxpbmdf
c2V0c3BlZWQgKH43MDAgdHJhbnNpdGlvbnMvcyksIHdpdGggYQo+IEdTdHJlYW1lciB2NGwyIGRl
Y29kZSBsb29wIChtZXNvbiB2ZGVjLCBILjI2NCArIFZQOSAxMDgwcCkgcnVubmluZwo+IGFsb25n
c2lkZS4gNDYgQyBTb0MgdGVtcGVyYXR1cmUuCgpQcmV2aW91c2x5LCB3ZSBlbmNvdW50ZXJlZCBz
aW1pbGFyIFBMTCBsb2NrIGZhaWx1cmUgaXNzdWVzIGR1cmluZyAKbG93LXRlbXBlcmF0dXJlIGJ1
cm4taW4gdGVzdGluZyAoYXQgLTEwwrBDIHRvIC0xNcKwQykgd2l0aCBHMTJBLCBhbmQgd2UgCmhh
ZCBwcmV2aW91c2x5IHB1c2hlZCBhIG1hbmRhdG9yeSBwYXRjaCB0byBjdXN0b21lcnMuIFRoaXMg
cGF0Y2ggCnNpZ25pZmljYW50bHkgaW1wcm92ZXMgUExMIGxvY2sgZmFpbHVyZSBzY2VuYXJpb3Ms
IHlvdSBjYW4gZmlyc3QgYXBwbHkgCml0IGxvY2FsbHkuCgo+IAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0cmFuc2l0aW9ucyAgIGxvY2sgZmFpbHVyZXMKPiAgICB2
Ny4zICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDUwMDI5MCAgICAgICAgMzMK
PiAgICB2Ny4zLCBubyBkZWNvZGVyIHJ1bm5pbmcgICAgICAgICAgICAgICAgIDI1MDA1NiAgICAg
ICAgIDAKPiAgICB2Ny4zICsgdGhpcyBzZXJpZXMgKDEtNCkgICAgICAgICAgICAgICAgIDUwMDA4
OSAgICAgICAgIDAKPiAgICB2Ny4zICsgcGF0Y2ggMi80IG9ubHkgICAgICAgICAgICAgICAgICAg
IDUwMDA2NiAgICAgICAgIDAKPiAKPiBTbyBvbiBHMTJBIGl0IGlzIHRoZSAyMCB1cyBkZWxheXMg
b2YgdGhpcyBwYXRjaCB0aGF0IG1ha2UgdGhlCj4gZGlmZmVyZW5jZS4KPiAKPiBUZXN0ZWQtYnk6
IEpvaG4gTydDYWxsYWdoYW4gPGpvaG5vY2FsbGFnaGFuQGdtYWlsLmNvbT4gIyBSYWR4YSBaZXJv
IChHMTJBKQoKVGhhbmtzIQoKPiAKPiBUaGUgdGVzdGluZyB3YXMgc2NyaXB0ZWQgd2l0aCB0aGUg
aGVscCBvZiBhbiBMTE0gY29kaW5nIGFzc2lzdGFudDsgSQo+IHJhbiBpdCBvbiBteSBib2FyZCBh
bmQgY2hlY2tlZCB0aGUgcmVzdWx0cy4KPiAKPiBUaGFua3MsCj4gSm9obgoKLS0gCkJlc3QgcmVn
YXJkcywKQ2h1YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
