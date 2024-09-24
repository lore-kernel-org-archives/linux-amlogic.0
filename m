Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AAACF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQ9AMSo7whggfwfCd6pUB2UuKPQBuROunGHwgr0l5Dg=; b=vWEgUp5ZYnDA1TRDvJlMO+0y+1
	WODPFIsTKSbnDpOG0B+Bg7zQRdCm8c6g0BO40TBvxtCystH7H3qZmA9kVb2sZga/bfwbKlDrbfz1e
	bwC2DbfDUzQN0877rICu8DUj7/ty6LkrYuHN35iWJKSQA9BsaEBo+rb8y5zvvXJ0epinqxmEkVikv
	oNPxkI5h9hUwzdbwirbVQdK9VQO1RUhD/5eN/eNakpIPS0RZGJGFMXvz8dWD11CmTs8cKQkoNNrSv
	0Z3LkePUzlm36oVYqqv5sZ6wzwR4EGMPkxnJ47l4tNDiDZEpC3mA+P8xAemGRMXgqc3l+/NUg4Enl
	4jxEQnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2lr-00000001zy2-2mOc;
	Tue, 24 Sep 2024 10:27:51 +0000
Received: from mail-sgaapc01on20729.outbound.protection.outlook.com ([2a01:111:f400:feab::729] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st2lo-00000001zxY-1PX0;
	Tue, 24 Sep 2024 10:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2vIKxxrQpD7wddLzejyKKR9gDHZptEfEtxYlNksMrW94R0OEFUc4vsP8r1mW9sjiMByHT+tKSp1Bl/WIYVLNitFXRTLq7RZGvAfHCcPmS0jILyMg8EOR2GLyVMpD23lNtyCxZIah8ytrBHEsJBzMCvzYVJx++JGgPOxJcb0hamD3+bvMcxp9An4K8j/eP3h54Xb9uXHZpGnNYzKxopBQpHmAk2xA1OZCN5LF/z719CbR4h/eq0JUJCUhuOnx+C1IqH7/PwnOdFenzBSARWqrNTIOzFDtDlAHDVJw6bDG4USm7LC4r0ZBqyKYZZmSGJEmhxCKCcQ/9CbRY7TSz7UaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TxI9CzGsekMh9uJyIWrl9SQcaB+CJ06ve7qnToojUQ=;
 b=HPEuksQk8Hb5DQOrVXqxSlgzY1a1cMQQkkoNwCg0iyozo5NIOesp3iyxt+B+h7ojJTd4adxwxlXvUJBbr4b2Rely2r3FjT8E885moLwAX+IXw6+46zagQEA7MC8JGP0SKoVIDT5IFYloR7uxo/SZIEoH+Cimx66UghB4nm1SkHgKWI3GvV+2UlvfpBnsrk6AxLcochXosoSSX5Tixe5kZSCBkc3GIM6Alsi9kZLIP6mZji/UdKPKWsd6l8lwG2KUdajS99eFbBAQoCuccaJ2nFiBygqyyzpzzQY5xkIsKIMav32e2mw7Iq0JTDTEAxS+JfDq7l6hNE0ubqpyQuBM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TxI9CzGsekMh9uJyIWrl9SQcaB+CJ06ve7qnToojUQ=;
 b=zJUwy38N/gXJaTo4DTLmOUMrKfQsZIw4JzVXLROus+NrWP3r7ULrwn9Y07+eg1G1BZKOWy0oAfS2+ARO3tT4wReLk5i3mYgo3o3LNOB2u/p+oaNeYFaLYVfEbx9/P/apkV3YWVGERtV+6++e98hpFiyRS/nbPfE+yo9vjk611Nro8HCIJkPnF8CNN+kSzspXkTR4n10o9n5ucBIquwuK1OnQg/9+80atIqf+iDEUhO62wwOlQIBpi3E1/G0EMsJ0zoyPrjxIjNqYVBWVfJRhZQC+CINso9bzNGS2aZyFZZ5CbwrSY2NemSWCDlqsUnh/RzHylqV6CbgHzlU726qF1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB7461.apcprd03.prod.outlook.com (2603:1096:101:147::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 24 Sep
 2024 10:27:37 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 10:27:37 +0000
Message-ID: <e458a1c6-5e85-4ecd-a21a-3407a6dd832b@amlogic.com>
Date: Tue, 24 Sep 2024 18:27:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: meson: pll: Update the meson_clk_pll_init execution
 judgment logic
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com>
 <1jy13hxwp2.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jy13hxwp2.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TYAPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e028ed-0913-42cc-b0bf-08dcdc8382b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm1mc2xZSXJCNFZHVmJlSXdXNFNxbXA5WmhUZFVjakMvc2dVdXZQbnRQVXZv?=
 =?utf-8?B?Q1VjVG1rZStIbDllWWZMQVl4Yk9MRlpaUC9lbDc5Sm9abytVWXJKNlBoeXp2?=
 =?utf-8?B?R1FlN1VrVFVuUHEwMDRVUExpd1BqZlBaWWMzeHhEcWEySmVGSTgxS0s5ekpQ?=
 =?utf-8?B?ZW0yc012YlRnRGFjQnhJdUVNeCtIa2l4Ym42bGdpSUVxUUNvVWQ3aG5GRlJ5?=
 =?utf-8?B?NlIxNnBmdjZpZjRXNDcxVHYwNGdZRkhzWlNFcGQrNjEvSS9xNmhxaVNYMTlO?=
 =?utf-8?B?WHhSVnNTRTNxQ3JyS0h2Ky94YkdBakNPbHJJVlkweUlLZWJOdERzbk1QME56?=
 =?utf-8?B?Y1VpNExkTlNPbzlHT1Q1aXB6QytEQmVsbi9pNVZJQVlqNjVCVU9yYk1tZVZl?=
 =?utf-8?B?bTJsbzE1NzA1MS9GV0RBSmFvL2I3Z2NaWkxUbnVzRGNwM25Hc25WT1hwU0JI?=
 =?utf-8?B?dGRLVkFpM3NmdkRPYlN3TUlhQ0tJYjZValFtUlBLT3NISEozOGJtc3hTSXZt?=
 =?utf-8?B?UEh3UC9jWDFRcnF4Si9YN0JuYTkyeHRPVElwckRrbVZkZVROdTh4WkJyMFcr?=
 =?utf-8?B?ZkZWclV0ck5SYU0wWWZoVWVMLzBPbThFU1BXNHplUGtPekhmQ1psZkEwSW94?=
 =?utf-8?B?QUZSblVvemhNR0lnRW95ejNBbEVZNnhZU20yUU1ZSW1NVlJFTnV2dUM4ZWxv?=
 =?utf-8?B?NUJzTGxKS3FkK3FTVm41U1hhM2g1TmxMbzFDTGFwWXkxTEFTRnFod21PWWNY?=
 =?utf-8?B?dit6UkU1azZOaUIrb2x6aE96WjYrNkJvNm54L2JCTHplUlZFd2JVU09NZEMz?=
 =?utf-8?B?RWZGcVZieEFoZm5hZ242Q3lwaS9lbyt3YkJyWnB2Zm9tNFU1Ujd3NkRCRFJu?=
 =?utf-8?B?RUd0VUlzU1JCU0FTR3VOcnJld0FrZm5lREN3bDN3RkFEQ21wRGdQdHNHTnFP?=
 =?utf-8?B?YmJRQnZIVWJkTU9jS2k3QkhLeWJ5TzRhRzM0ckI1RFNrd1JvWis2dFk5TnFM?=
 =?utf-8?B?VGFKdUU4bk4ySFJNb0s5cUVxd05XS2FLYWNoNWRUeXJjditSMGl2YlNXZE9z?=
 =?utf-8?B?aTFqeGlaaGdaUG55QXU3dG4yS2wxMlg1ZU92Rjk2eFV4Y0tydnJtZ2IyeWhs?=
 =?utf-8?B?S1o2NVFybGREL0ZPZTlXcGhIbkJpclZRR1dIbTB5QkFsMGVyNlJuM3M4RkhF?=
 =?utf-8?B?VWFTSVFuZGhROVlsUjI5d0dUcEI1czJ3QS9rb2NQVmRGRnZXWUl5TG9wWWZ5?=
 =?utf-8?B?VzMyaU1jKzBtMHkwY1ZEcHltenRuS2oyYmpoeUU5TktFc3Y0aVVHUmU0cy94?=
 =?utf-8?B?VlptRjhuR0VEMHM1RlpSZ1JmanJKOWczclE3anNYc0Zza3YyZXk5RFVKK21m?=
 =?utf-8?B?cUQwZUpTa3hJQUxXcDAreHk1RmoxS2tpeUl2Uk9KaW1pTTJZRWtOVWtxNlI0?=
 =?utf-8?B?UTg3akE1b0M4Z0p4L2dWQldUYUVUQjhwcDNOa2FvNDgvd3NqTzdKeVVFeDB5?=
 =?utf-8?B?TlMxSVVScW1wOWVydGg2di9CaVI2UmdYdHpJMFFwRDE0R1RRQXhPQ3VMNW11?=
 =?utf-8?B?NTBkMmNTaTdhUFllT09uNFRGSFRrclJhbXJqNXBCQ3A2NWEzejAvNXkzWE5x?=
 =?utf-8?B?RkNQNHhWUTRUN0ZVaEQxNlkzUHVxSEV1MXo4N2JYcnBUaXBNbnFtaGZUNkV1?=
 =?utf-8?B?NjBKV0xMaHEvSXZUOEFCejVYYjA2aXp2dHFSZlJaU1ZBTVhxRVpVYmFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3RmZjkwemtrU2tnU3pSYU50ZjVHSk0vNHRla2tqSjlJTGl6TXRnRU1rRlJN?=
 =?utf-8?B?TXR2WHBBMGk0d2FiWDRXOWZ2MG0yWXhKTUd0eWRqUWpPZDlsTURXZzJOdW9z?=
 =?utf-8?B?NjlzZGVKV0FrQVM5dkU1YmtMbzlNREtibWdVbXdiVEJUUWhPREpaZFhNd0t0?=
 =?utf-8?B?OTVNcnF3RE5oK1BIRGsxVzVSZ0tvd0tjTnZqR2xNZmJodXg4T2NsN0NjdHdI?=
 =?utf-8?B?SmhyWjY3MVlXTldRdjJlaHpzZGo3bmJTSFFqSmZJc1lKQnJqeVN6dVhEZmlU?=
 =?utf-8?B?OS9iaEtGOWVGdGtjUTJ5MDlDN1Z2Wlo3SGp4bUh5ZjJId2hpdVVDSDhEaFRs?=
 =?utf-8?B?RW41d3NNZGJRa3ZaREE0ZXcvS1I0cHFYbndyLzU5eDdsd2JUdWNGWEJvUWha?=
 =?utf-8?B?RE8zMDVIUXNyZm40a3M0Vi9lR1BDUUlkOGJKOTF6UkZ1MUdNcnFpT1JUcFNR?=
 =?utf-8?B?Ty8xVStXUmZWaU9BRVo5ejdXV2RvRXd1bWdDeE1jd2RzL2NEakM4d2cyV0F0?=
 =?utf-8?B?Zi9XT1JITlQwWkdqZm80MUxvMUxETGJKTDN2cFJEUWJtRjJZMTYvZ29LT0Np?=
 =?utf-8?B?L1c4OFpkV1YzalJCRWhWRDNzMlFMdFYwUXlZNTRMUzJHUGxyeTYvR2VocUpS?=
 =?utf-8?B?M2hqYlFjeEhaOW9hNEtaR1FEWlBkamdING5LaURsbkNtODdhNWxMS0NxQXhk?=
 =?utf-8?B?OERsQUhtMW0rL1IrRW1KVVora1gyd2o1K3ozWW1ydU5tUjBObU1lbmZBT0NY?=
 =?utf-8?B?TzZibmVIdTU2YmF5SjNmY1dtc2FMWmIzVGorZGN6SDJxb1dNQ3pQUnRJZlNS?=
 =?utf-8?B?QVMzWjQrbHBZOHpaanU0VzkyZHBJbHMzbnJVYVZIVWlIbmQ5OWlmMHlKUEhQ?=
 =?utf-8?B?NXU3L3hOUG14alBaU21MbDJQc202V2NUem5NNFBOejZMVXhQWXliYm1TQzdC?=
 =?utf-8?B?aDJiWXAvNzdBU3BBOXlySzFjRFYybTgzcElnY2xRWmgyM1E3UUc2S3grNGlq?=
 =?utf-8?B?U2lSckdtMmpXUzF6aDdQNzg1UHUzcllTaWR6dDhFejdxVzE3VGRjL1BtRnMz?=
 =?utf-8?B?MEJFWFdMejZkeUlOMGlXaThRelNXcEJKWjZkNFIrZC9NUUJUdFNiTDlVa000?=
 =?utf-8?B?N3RIQU9XaHhmaVAweGROMzBhSTl4MStPa21MZXlwcmErWU91ZlVRSExJQ0xx?=
 =?utf-8?B?MzMvYmRNODVhRlFMMS9iSldLU2FUYk9vL01pYlExbzRSRGtXdnlKbTB0ZkZM?=
 =?utf-8?B?NzU3MEtKbjB0WXBmT2tENmdiWEhoV1hVdldrcFlXZFNERWg2NW1WdDhmZ1hR?=
 =?utf-8?B?MzBYNndaaVpXbnN1Skl6STM0M0JrUW40YkJsRTFzS0hrZEM1aE9SNzRWTTNN?=
 =?utf-8?B?Z0REUzZiL29jUG82V0x0aHVkN0phdFlaUE9id0QrQnRDeTVBNG5uTW41b3VO?=
 =?utf-8?B?cWQzNC90UFN6SEZtc2xoYXZLQWl1Z1ZXU3ViN3ltVElJNnJYK3pTTHdoa3hy?=
 =?utf-8?B?RnlHT0wzNWJyc1QrNENYMGdTdUJRSGNaaWZlVkk5T1ZDaFhKK2F6WGpnbkFh?=
 =?utf-8?B?RmlqeUpLTFVKRnc4WHRxWHUxY2hEMmFheWVvQ0pIUWZjVmVwWk5mNGszakJ6?=
 =?utf-8?B?Vm1LZkpxRkdoWUZHSXNvL042RkRzcG0xL1doZDM1TnBxVVRvMGVRQ2NJbGl1?=
 =?utf-8?B?RGNtZFROSjY0RUdJQ24yMmF6KzhGbjFkQ1FiR1hYcjhzKy9BWnltQjBHQjBp?=
 =?utf-8?B?QU1ObUVzYW4vc3p3b0drRjhsVkhuLzRmUmJyRmd5L1BSb2QxaGs1TjhWOFVW?=
 =?utf-8?B?amFsTEdUUmVSOGo3eWdqK1o3K1A5WEl2OHdxanp6bnAvaHlQZFZIS2RZZHJ5?=
 =?utf-8?B?U2FJTEx0Q0M3MGhpRkhreFdaeVp1eVUvbE1McXNvQ2FrZ2xZdVArVDAvYUpM?=
 =?utf-8?B?bzVCOE9iQi8ySnFHS3ZoUzJKckd5cmpSckpSSUxSTWdudndTTUlFVDllZytU?=
 =?utf-8?B?Yk95T1VVdkMreFU4NUNPNThRclFSNnhJNWdMc1gyUlhwN1ZtUmtrOUhzbE5E?=
 =?utf-8?B?emg4ZE9qbzV2S3BpNzFrTDJFZGRhR2IrOTdRUlhpTXEydDkyc0RBR29GQXUz?=
 =?utf-8?Q?znnb/c5HE/oUiVbxT+awz7a0I?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e028ed-0913-42cc-b0bf-08dcdc8382b4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 10:27:37.3221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4W+aOPykIDGUwC0lU6sZtP3uPoPRz4z8gcb4DSf52C2pLr+JF/oRaay1M8nS2mNFmcbh8VMnN/ayx7gyTclTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_032748_609719_322A86CE 
X-CRM114-Status: GOOD (  34.48  )
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

Ck9uIDIwMjQvOS8yNCAxNjo1MCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPgo+IE9uIEZyaSAyMCBTZXAgMjAyNCBhdCAxNjoxMywgQ2h1YW4gTGl1IHZpYSBCNCBS
ZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4K
Pj4gRnJvbTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+Cj4+IFRoZSBoYXJk
d2FyZSBwcm9wZXJ0eSBvZiBQTEwgZGV0ZXJtaW5lcyB0aGF0IFBMTCBjYW4gb25seSBiZSBlbmFi
bGVkCj4+IGFmdGVyIFBMTCBoYXMgYmVlbiBpbml0aWFsaXplZC4gSWYgUExMIGlzIG5vdCBpbml0
aWFsaXplZCwgdGhlCj4+IGNvcnJlc3BvbmRpbmcgbG9jayBiaXQgd2lsbCBub3QgYmUgc2V0IHRv
IDEsIHJlc3VsdGluZyBpbgo+PiBtZXNvbl9jbGtfcGxsX2lzX2VuYWJsZWQoKSByZXR1cm5pbmcg
ImZhbHNlIi4KPj4KPj4gVGhlcmVmb3JlLCBpZiBQTEwgaXMgYWxyZWFkeSBlbmFibGVkLCB0aGVy
ZSBpcyBubyBuZWVkIHRvIHJlcGVhdAo+PiBpbml0aWFsaXphdGlvbiwgYW5kIHRoZSBqdWRnbWVu
dCAiQ0xLX01FU09OX1BMTF9OT0lOSVRfRU5BQkxFRCIgaW4KPj4gbWVzb25fY2xrX3BsbF9pbml0
KCkgYXBwZWFycyByZWR1bmRhbnQuCj4gQXBwYXJlbnRseSB5b3UgbWVzc2VkIHNvbWV0aGluZyB1
cCB3aXRoIGI0IC4uLgoKCmVtbW1tLi4uIEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIHRvb2zw
n5iCCgoKPj4gLS0tCj4+IFRoZSBoYXJkd2FyZSBwcm9wZXJ0eSBvZiBQTEwgZGV0ZXJtaW5lcyB0
aGF0IFBMTCBjYW4gb25seSBiZSBlbmFibGVkCj4+IGFmdGVyIFBMTCBoYXMgYmVlbiBpbml0aWFs
aXplZC4gSWYgUExMIGlzIG5vdCBpbml0aWFsaXplZCwgdGhlCj4+IGNvcnJlc3BvbmRpbmcgbG9j
ayBiaXQgd2lsbCBub3QgYmUgc2V0IHRvIDEsIHJlc3VsdGluZyBpbgo+PiBtZXNvbl9jbGtfcGxs
X2lzX2VuYWJsZWQoKSByZXR1cm5pbmcgImZhbHNlIi4KPj4KPj4gVGhlcmVmb3JlLCBpZiBQTEwg
aXMgYWxyZWFkeSBlbmFibGVkLCB0aGVyZSBpcyBubyBuZWVkIHRvIHJlcGVhdAo+PiBpbml0aWFs
aXphdGlvbiwgYW5kIHRoZSBqdWRnbWVudCAiQ0xLX01FU09OX1BMTF9OT0lOSVRfRU5BQkxFRCIg
aW4KPj4gbWVzb25fY2xrX3BsbF9pbml0KCkgYXBwZWFycyByZWR1bmRhbnQuCgoKWW91IGhhdmUg
YSBwb2ludCwgYnV0IHdlIGRvIGdldCB0aGlzIGtpbmQgb2Ygc2l0dWF0aW9uIGFsbCB0aGUgdGlt
ZToKCkZvciBleGFtcGxlLCBoaWZpX3BsbCBwcm92aWRlcyBhIGNsb2NrIGZvciBhdWRpbywgd2hp
Y2ggbmVlZHMgdG8gYmUgCmNvbmZpZ3VyZWQKCmluIHRoZSBib290bG9hZGVyIHBoYXNlIGluIG9y
ZGVyIHRvIHBsYXkgYXVkaW8gYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlciAKYm9vdC4KCkFmdGVy
IGVudGVyaW5nIHRoZSBrZXJuZWwsIHRoZSBoaWZpX3BsbCBmcmVxdWVuY3kgbWF5IGJlIGR5bmFt
aWNhbGx5IAphZGp1c3RlZAoKKHRvIG1hdGNoIHRoZSBhdWRpbyBiaXQgcmF0ZS9hdWRpbyBhbmQg
dmlkZW8gc3luY2hyb25pemF0aW9uLCBldGMuKS4gVGhlIApncF9wbGwKCnRoYXQgcHJvdmlkZXMg
dGhlIGNsb2NrIGZvciBlTU1DIGFuZCB0aGUgaGRtaV9wbGwgdGhhdCBwcm92aWRlcyB0aGUgCmNs
b2NrIGZvcgoKSERNSSBhcmUgYWxsIGNvbmZpZ3VyZWQgZHVyaW5nIHRoZSBib290bG9hZGVyIHBo
YXNlIGFuZCBjYW5ub3QgYmUgY29uZmlndXJlZAoKYXMgUk8gaW4gdGhlIGtlcm5lbC4KCgpNeSBp
ZGVhIGlzIHRvIHN0aWxsIGRlc2NyaWJlIHRoZSBpbml0X3JlZ3MgaW5mb3JtYXRpb24gaW4gdGhl
IGtlcm5lbCBpbiAKdGhlIGRyaXZlcjoKCjEpIElmIHRoZSBib290bG9hZGVyIGlzIG5vdCBlbmFi
bGVkLCB0aGUgUExMIHdpbGwgYmUganVkZ2VkIGFzIHVudXNlZCAKZHVyaW5nIHRoZQoKYm9vdGxv
YWRlciBwaGFzZSwgYW5kIHRoZW4gZW50ZXIgdGhlIGtlcm5lbCBmb3IgaW5pdGlhbGl6YXRpb24u
CgoyKSBJZiB0aGUgYm9vdGxvYWRlciBoYXMgZW5hYmxlZCBQTEwsIGluIG9yZGVyIHRvIGVuc3Vy
ZSBjbG9jayAKY29udGludWl0eSBhZnRlcgoKZW50ZXJpbmcgdGhlIGtlcm5lbCwgaXQgd2lsbCBu
b3QgcmVwZWF0IGluaXRpYWxpemF0aW9uIAoocmUtaW5pdGlhbGl6YXRpb24gbWF5IGNhdXNlIHRo
ZQoKbW9kdWxlIHRoYXQgcmVmZXJlbmNlcyBQTEwgdG8gd29yayBhYm5vcm1hbGx5KS4KCkNhbiB0
aGUgY291cGxpbmcgYmV0d2VlbiBib290bG9hZGVyIGFuZCBrZXJuZWwgYmUgYXZvaWRlZCBvbiB0
aGUgcHJlbWlzZSBvZgoKZW5zdXJpbmcgZnVuY3Rpb25hbCBpbnRlZ3JpdHkuCgoKPiBJZiB0aGUg
UExMIGlzIGVuYWJsZWQsIGl0IGhhcyBiZWVuIGluaXRpYWxsaXplZCwgdG8gc29tZSBleHRlbnQK
PiB5ZXMuIEhvd2V2ZXIgd2UgaGF2ZSBubyBpZGVhIHdoYXQgdGhlIHNldHRpbmcgd2FzLiBJbiBn
ZW5lcmFsLCBJIHJlYWxseQo+IGRvbid0IGxpa2UgaW5oZXJpdGluZyBzZXR0aW5ncyBmcm9tIGJv
b3Rsb2FkZXIuIEl0IGJyaW5ncyBhbGwgc29ydHMgb2YKPiBpc3N1ZXMgZGVwZW5kaW5nIG9uIHRo
ZSBib290bG9hZGVyIG9yaWdpbiBhbmQgdmVyc2lvbiB1c2VkIGJ5IHRoZQo+IHNwZWNpZmljIHBs
YXRmb3JtLgo+Cj4gU28gaW4gZ2VuZXJhbCBhIFBMTCBzaG91bGQgYmUgcmUtaW5pdGlhbGl6ZWQg
d2hlbiBwb3NzaWJsZS4gV2hlbiBpdCBpcwo+IG5vdCBwb3NzaWJsZSwgaW4gbW9zdCBjYXNlIGl0
IG1lYW5zIHRoZSBQTEwgc2hvdWxkIGJlIFJPIGFuZCBsaW51eAo+IHNob3VsZCBqdXN0IHVzZSBp
dC4KPgo+IFNvbWVvbmUgYnJvdWdodCBhIHNwZWNpZmljIGNhc2UgaW4gYmV0d2Vlbiwgd2hlcmUg
dGhleSBuZWVkZWQgdG8ga2VlcAo+IHRoZSBQTEwgb24gYm9vdCwgYnV0IHN0aWxsIGJlIGFibGUg
dG8gcmVsb2NrIGl0IGxhdGVyIG9uLiBUaGUgZmxhZwo+IHByb3Blcmx5IGlkZW50aWZ5IHRob3Nl
IFBMTHMuIE11Y2ggbGlrZSBDTEtfSVNfQ1JJVElDQUwgb3IKPiBDTEtfSUdOT1JFX1VOVVNFRCwg
ZWFjaCB1c2FnZSBzaGFsbCBiZSBwcm9wZXJseSBkb2N1bWVudGVkLgo+Cj4+IEluIGFjdHVhbCBh
cHBsaWNhdGlvbiBzY2VuYXJpb3MsIFBMTCBjb25maWd1cmF0aW9uIGlzIGRldGVybWluZWQgZHVy
aW5nCj4+IHRoZSBib290bG9hZGVyIHBoYXNlLiBJZiBQTEwgaGFzIGJlZW4gY29uZmlndXJlZCBk
dXJpbmcgdGhlIGJvb3Rsb2FkZXIKPj4gcGhhc2UsIHlvdSBuZWVkIHRvIGFkZCBhIGZsYWcgdG8g
dGhlIGtlcm5lbCB0byBhdm9pZCBQTEwKPj4gcmUtaW5pdGlhbGl6YXRpb24sIHdoaWNoIHdpbGwg
aW5jcmVhc2UgdGhlIGNvdXBsaW5nIGJldHdlZW4gdGhlIGtlcm5lbAo+PiBhbmQgdGhlIGJvb3Rs
b2FkZXIuCj4gVGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhvc2UgUExMIHNob3VsZCBiZSBSTyB0aGVu
Lgo+IElmIHlvdSBjYW4gcmVsb2NrIGl0LCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gcmUtaW5pdCBp
dCBhcyB3ZWxsLgoKCnJlLWluaXQgbWF5IGNhdXNlIGdsaXRjaCBpbiB0aGUgUExMLCB3aGljaCBh
ZmZlY3RzIG1vZHVsZSB3b3JrIGF0IGxhdGVyIApQTEwgbGV2ZWxzLgoKCj4+IFNpZ25lZC1vZmYt
Ynk6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJz
L2Nsay9tZXNvbi9jbGstcGxsLmMgfCAzICstLQo+PiAgIGRyaXZlcnMvY2xrL21lc29uL2Nsay1w
bGwuaCB8IDEgLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgYi9k
cml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPj4gaW5kZXggODlmMGYwNGExNmFiLi44ZGYyYWRk
NDBiNTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+PiArKysg
Yi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPj4gQEAgLTMxNiw4ICszMTYsNyBAQCBzdGF0
aWMgaW50IG1lc29uX2Nsa19wbGxfaW5pdChzdHJ1Y3QgY2xrX2h3ICpodykKPj4gICAgICAgICAq
IEtlZXAgdGhlIGNsb2NrIHJ1bm5pbmcsIHdoaWNoIHdhcyBhbHJlYWR5IGluaXRpYWxpemVkIGFu
ZCBlbmFibGVkCj4+ICAgICAgICAgKiBmcm9tIHRoZSBib290bG9hZGVyIHN0YWdlLCB0byBhdm9p
ZCBhbnkgZ2xpdGNoZXMuCj4+ICAgICAgICAgKi8KPj4gLSAgICAgaWYgKChwbGwtPmZsYWdzICYg
Q0xLX01FU09OX1BMTF9OT0lOSVRfRU5BQkxFRCkgJiYKPj4gLSAgICAgICAgIG1lc29uX2Nsa19w
bGxfaXNfZW5hYmxlZChodykpCj4+ICsgICAgIGlmIChtZXNvbl9jbGtfcGxsX2lzX2VuYWJsZWQo
aHcpKQo+PiAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiBJJ20gbm90IE9LIHdpdGggdGhpcy4K
Pgo+PiAgICAgICAgaWYgKHBsbC0+aW5pdF9jb3VudCkgewo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvbWVzb24vY2xrLXBsbC5oIGIvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oCj4+IGlu
ZGV4IDk0OTE1N2ZiN2JmNS4uY2NjYmY1MjgwOGIxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Ns
ay9tZXNvbi9jbGstcGxsLmgKPj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oCj4+
IEBAIC0yOCw3ICsyOCw2IEBAIHN0cnVjdCBwbGxfbXVsdF9yYW5nZSB7Cj4+ICAgICAgICB9Cj4+
Cj4+ICAgI2RlZmluZSBDTEtfTUVTT05fUExMX1JPVU5EX0NMT1NFU1QgIEJJVCgwKQo+PiAtI2Rl
ZmluZSBDTEtfTUVTT05fUExMX05PSU5JVF9FTkFCTEVEIEJJVCgxKQo+Pgo+PiAgIHN0cnVjdCBt
ZXNvbl9jbGtfcGxsX2RhdGEgewo+PiAgICAgICAgc3RydWN0IHBhcm0gZW47Cj4+Cj4+IC0tLQo+
PiBiYXNlLWNvbW1pdDogMGVmNTEzNTYwYjUzZDQ5OWM4MjRiNzcyMjBjNTM3ZWFmZTFkZjkwZAo+
PiBjaGFuZ2UtaWQ6IDIwMjQwOTE4LW9wdGltaXplX3BsbF9mbGFnLTY3OGE4OGQyM2Y4Mgo+Pgo+
PiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
