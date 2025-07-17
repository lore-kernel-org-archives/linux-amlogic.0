Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56EDC83F1B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jul 2025 03:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GadoNTrbkr57DHVf122H6ie3YqxOPBOMR7L/n7/jAGc=; b=oa6gY41ViFvbfcp3plt0w9UivJ
	w2KOP973tfmwe3Hl7nFDnkdrgDD+Hc0rkzcS8n8BItH7jGLCWi2299xnY8YlPPWLu4sCTMIBf7GLT
	nSbA0DtPRewpmclfrngH2BsPFmZ7LiENwo/hyvjNFnB/J+A4eC6kOoMX1Y2Hw+9+Vg/rNn57v/aSu
	yPwP88tBAyjCkadYCxLbK5wZ4exZBFtr4w2KIS/kh7AwcvjLf2WC04rb5ejd1b0xsuRibZzSUElVd
	j7tD1+Xn2Fs8m9JeL/iBl16TdT9EkVj0k7CT6H35IaHboESmeLmIluXr4RkpCgb8Kqwu9EDVcnDd4
	rpz0t5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucExu-000000096Db-31YM;
	Thu, 17 Jul 2025 03:07:22 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucExr-000000096CR-2z4a
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Jul 2025 03:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLl9sl6mjF55/zMQnFXazsoZpMyI8td6C7VdqiwweeDxeBAtWWtUkvKMjvQNg4ZMbDYgbTaxEE79Mi1S7xoQu2N/Nn/NxZspeMTYP4TbmLpBqdu0O4NO1BeZC5pK8G8PAWhIk3H8C5qs2xRnUiDA4YeeBjjpKh4gFc6rIzogb9l7lsaG/jnZQD4rjDkVZizTkzHO4FK41NPId0x2g7bOvUdyJZqxBSivbQuJ3d2XgA5cjFgY8I9kb76tSMgw9WNNZJHHYNQKc0PjJh5KdBF5RE/jMCyt03VvAQJaYLMBg/RINDpJabjj1EBZYnI/lG4hcxdC1/8qYUJCeuaiKa5yGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6srlpyOysfxSxp//CePCeOexlHkcn/jCRPFIF8Lut4=;
 b=PDkAg2HSl6uWbgnkyg0rpVVO0GyBLhi71mLFfzXikUhL85sqLvQYFhh05iO/x3ZPY2OqNn1tEbhwVuuF5iQU9ZAJ8YEZNoQFhrU4yLeyXbMnfn97qn5WXyN5kSaOkkW4LC6TClO+Hp9HhW/rszU0z8Vk+adQfwY7B3WNYZq6tOVuLZSQ/SI3FIMhP2lSj23HDisLK7QS+qrKeLJageKAmE7ji8oq8yX0n4WEpFcSb2NMRvT1Y9r6glf4qOUhG78Bh2gqCHB/NJsCPUYDOeiR2NfoL+56DRnjJlSvdpBF8ppfyx1OY6n/ryDEzJtirACkwmbH5uUVuV0LbGdBWhMgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6srlpyOysfxSxp//CePCeOexlHkcn/jCRPFIF8Lut4=;
 b=IFFSRuBPZUgvttaAfNGxpSKFchquvK4BNawr4gsGMJHda4RKJc4+NzvoJwwZ9PvbYKsH3dmzxihnF+mryAyjoDENhOjZ61Jh6vTJBVx54yKhAG1oEFQtm4RUjg2vU7/uoQFU//4l3Tt6HeKgqSs0Oqc+aOPtIAD9DDmDLuekJx4Ahv0emwgXuaKsJKa8s1zLHIPbCHlKZCTRCDx1E36vOEzkP1SvasIYrYhRo6N3UgKEfHI1UhAuGvlgnlrsnsm9DnSTctAg6rsd2laM5MoSMAXlYP/1cywZuTxHwgXstwCigr5QLJ0fBLhjeC/iAPQ+8tk08P1cgSFaO723e11bJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB6850.apcprd03.prod.outlook.com (2603:1096:101:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 03:07:01 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8901.024; Thu, 17 Jul 2025
 03:07:01 +0000
Message-ID: <851350ce-b1fa-4bf9-ac81-b926215acf65@amlogic.com>
Date: Thu, 17 Jul 2025 11:06:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
Content-Language: en-US
To: Da Xue <da@lessconfused.com>
Cc: Mark Brown <broonie@kernel.org>, Sunny Luo <sunny.luo@amlogic.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
 <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
 <3ac88119-9980-42df-9e1c-c0ec30bbaadd@sirena.org.uk>
 <55ecc836-7fed-44d5-aa4b-94bc17894ef0@amlogic.com>
 <aG0hU5nbjLjTWS6p@finisterre.sirena.org.uk>
 <03b7abe4-95d5-44f4-96ec-989c736e58b0@amlogic.com>
 <b42995ed-d1d5-4624-88ab-4ba1b6f54ebe@amlogic.com>
 <CACdvmAizF9OcdBi=Qw38NH+YHT=4edQzJGuQNvxm+m5xqZE0nQ@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACdvmAizF9OcdBi=Qw38NH+YHT=4edQzJGuQNvxm+m5xqZE0nQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0d3032-783a-4d07-0893-08ddc4deffb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blJKSGhTZ2t1aU1DcHFsN1dvc3lYS09PNTlwZURxelZ1WDBYc1BDMitXMXIx?=
 =?utf-8?B?bkdRRWxCdHU3Z1VpRlVPMkUzQlllNVZJRnF6ZDAyakJROXVTUnl2d0szYmRT?=
 =?utf-8?B?MWVDN2h5SzRnYlM4amlzQzR5U3dKTVRNc3hROTF1bUt0WlZnRzE3NUtMNzVN?=
 =?utf-8?B?eDVqc3RQb2xQOUlmVW5nTzQ2STF6dUFYRy8yVWZJZTg3NDB5eTFSMElxQlpx?=
 =?utf-8?B?aUY3enZPNDA3TS9PdUo4SWRGWE5BT3ZRUjc5ZG1ROTVSUTRGLytMR3NEbFpo?=
 =?utf-8?B?WVdKNUFqZEI1MkJhUmxhM1dCN3NQZFdvREJXWlFSaVgrVG9wNzJlVFdYUFFh?=
 =?utf-8?B?T0xZWmwvc1hQYytsa3FQSXJDWG1JTlFNdDB4cDN6WUptS3F6MHZtZVR6OEVt?=
 =?utf-8?B?N2ZmcEFFUEo0NEVyNmVORW93YUFGdDZaWjhkbXl5V2FsMjB0d2Z0ZkdRYUVN?=
 =?utf-8?B?UExyeUVHT3BITjFnTUx4QWNxTXF3ajVidm1YdjRVa1VjMVRITXhlc1h5bHlE?=
 =?utf-8?B?Wm5UKy9vTkNkT0dScHU2dHczMXpPdDJ2KzlEaHA1L3F1ZHhLL3B3c2hPRXl0?=
 =?utf-8?B?bW5QUTJVZmhscFMwaWR6bnk1UDk2ODd3OEFGa015KzVobmtPZUZiSTFra1ZW?=
 =?utf-8?B?NGYrcDRROHJRd090bUlXcmZQSFQ2VFVicHVZNEZtRmRlUmx6akxCdlY2Z3Fm?=
 =?utf-8?B?d0JQRUdJN3RVQmNIY0s1Y2RFWjhZb2ZYdzk5M3BCZHR6b0ExQ0diOHJpMUcx?=
 =?utf-8?B?K0VBY2RTM09uRGxUTDhlOU9mTkJTbnE4UmNidkw4Slg5OXgxMys1T2dGN21M?=
 =?utf-8?B?VEJ4cHNRQVZLblMrbWFaYkdHSFhRNGd4TzNkSE9WVFlLOFgyRGFmQ2NURTEx?=
 =?utf-8?B?QmRUM0FCVEdXU05KNTlnVXV5dEtMQUxzdWRYTytpajBDbEtDSVFPZkpySXVQ?=
 =?utf-8?B?NjJXWVlBVWZKNGFUZXFZemlJbHFraDlmWXE1UTE0OFVJa2hBdnNMWEpoQXho?=
 =?utf-8?B?TWd2cjI5ZFpXaC92cUhGVkxFVFBLY1FUdytTRU1DUDNXUDFGRDlCNHVwNTBJ?=
 =?utf-8?B?NGlEVkw3V3NKZWVvTFVSL1JoeWc1ZmI0RHBrSzd3ZDRpYk9zYU1jdVdEa0l2?=
 =?utf-8?B?QnJTWGIyMnZjVVNXL3YvUzkxR0Z6Qm1MZE1mWGErWE03WG53MGxQTWgwMTh4?=
 =?utf-8?B?YVBsR3V4L21keWVraC9vV2tVcklFbmJpa3AyU09YcVhibGZIVXZUM0FsU3J0?=
 =?utf-8?B?d1RTODJFOTQ4R1NhaVBjc0hicXdlS2JYUjE4Uk9pb1YzclZzNXJ2SklTaVFU?=
 =?utf-8?B?NkI5OGowcmdjMlRoWE9RNkh5bkJJVFhHMEVaaHhxOStsZHFHVVdmRzFhVjRp?=
 =?utf-8?B?dVhwUytPeks3emZoYmxySWdCMGFiRXE3MDVuY1hPeXF2VVRyZDdBTXByck9D?=
 =?utf-8?B?K3RDZElTVUVBZDJnbTk1R1dFL29idU8yaTNuQ21VeWRrSExBWXU2eHNvL01U?=
 =?utf-8?B?R2JvM1lCcGRNQXFIRXlLZ3VDajRuWk0rMk9qams2TmJpTGNxMkRQbTRoRG5Z?=
 =?utf-8?B?RnhLcFJMUnZIZTk4V2k5c0JmK1V5dUh4WENLVUVlN0xCalU2RUlzTWdiSm90?=
 =?utf-8?B?Z0liY2N3elk3SkNkckJHR1M2UUlueTZMOHJ3Wk9iV2hiSVh4TU1vbTZkNHJK?=
 =?utf-8?B?NFV5WjZpbDRNWldrdVZuWUliQVRuZlJTWmRSaGRlaDVSOEttdGdaOWtienJC?=
 =?utf-8?B?OU5iTlNabERONkEyUTd2UVkwK21NUjhrekxJZThGclFhK3YwNnpZUjQ4MlND?=
 =?utf-8?B?UVVLQUkxWk44dDVwWG5tSzMyUUpDZ21QNzRjcCtkUkNmbk9MaXpCb1lNQkdi?=
 =?utf-8?B?N01pS0J0Nys0ck8vTzJ1UGVDaGt3QVAxRVB5d2FvaHhJRHYwdFhVTHN6S0t5?=
 =?utf-8?Q?KMuPqmDikKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUlDN082d3NQMC9keG9RYisxS1BhVE1oWHQ4VnVPZERGTkFqV0JUOThGV0Vt?=
 =?utf-8?B?SHFTcGZheGRUcEhhMk9UTVNzL2UwM3dVRzhiOVVpZDhrZ1RqWXVEcElDTGhx?=
 =?utf-8?B?V1pROWJNdjliNFZKc2Y3R29rV3BYVFRVTW9BaXA2cGlTRm1aNFhlSTRpdUZH?=
 =?utf-8?B?USsvKy9xcXNJMHNhTktVMERXQ3ROKytaSEZlTVNVMlZ6b21HRnFUNUs3UEh5?=
 =?utf-8?B?NEdhK2U3SlN1b1krMTZTcXB1YXNxK1MvUXB4bldReVNiM080c2ZpQTRXUms2?=
 =?utf-8?B?WnNaU1BFTkt4VVIrQ3B6MXJYU1VDUW9na08weUV6aE9TS1MyOGxvQ0ZmQTFO?=
 =?utf-8?B?WmdrRTFmd3d0akZxeDBPR1JHd2hUdlJZOXZjYkZKL2hpR0RYQzlTVnNFc2xB?=
 =?utf-8?B?L1lDSnExYlZMRThJMkJpNHBxcDlDckFldE02OFF6NWlpaWhmblRXT2xXei9W?=
 =?utf-8?B?S0N4OSttS0tSTXZBYVVNNkcyVU5ZdGZXaTd6RVlwaUVYSk82aTBBMjF1WTBV?=
 =?utf-8?B?QU5pdHJxYnhhakVFbHdJVnZkaTY1VyszQTJFblFyQlYreDlYZyt5cVFEVVcv?=
 =?utf-8?B?SDFPZGdhVGxSSHFSUUNvU3NITmZqVDNMeWsrSUN3d1hZK2pZZzRRVjNCenh2?=
 =?utf-8?B?eWNISWFIcUxmY05ybDI0cnR6U1EyeUlZcTFWQkFZeWphcjd5OThjeTFUdnVa?=
 =?utf-8?B?OUNsRGNSeUcrVzhyMzR6OUVlb2JubStvT2lITUNub1Y5aDcwRlErOXVXMDNE?=
 =?utf-8?B?QzZ5TllEaGRrc2k4SWVhd3VNRitnVkM2VWlvRDhlUmh5ekdnRTIxS1Bxc1Jl?=
 =?utf-8?B?d0ZBTUJXcnI3NUZWc2w1QmYvMU9HdmtRbFZPUytnNDR1Um9hTlA1Wm1oczBz?=
 =?utf-8?B?ZlRUUEc0cGFreFNobitFc0pnbkRCODdjTUZvNXhFUmt5Y3crQjlCZ0dzUFB3?=
 =?utf-8?B?dVhOZEZRd2ZPK0w0bENFcWl1QXpuZVFlMU1BZjRlZFBheWhJa2JnTE01clpV?=
 =?utf-8?B?VFoyYlJMZWxUZmxjVXRWeEVnZFpsY21tTkZRWG5YV25rMEZWbTB5ZjhsQUc1?=
 =?utf-8?B?MThncEhRUEIrNzdlbTBVSVU5VFpESHlzOEowVlJjMjNwZWc4U21VVW9mTTZx?=
 =?utf-8?B?ZDM3NVdaTm9pTHJEQzIrT1c5WjhCNXdSOUpzQ2p1SVhmTDRiU0xKZVhYMHht?=
 =?utf-8?B?aHQ1bVNUbkJ5SnQ3NTdvRUdrL2tXWm9pNXg2WkpVWldmS2hvejJrUXpteUp5?=
 =?utf-8?B?ZVlSUkV5ZEtSaW1EaS9DSFFRUExzQTJtN2JDeUMxb0w4eG1vRDA3T2x1Tllz?=
 =?utf-8?B?SmFXQ210ZzAwSVF6ZkJ0MVlETVdPZHczREM4RzR5Y0JvUkF0cGU3SlF5Tkxw?=
 =?utf-8?B?UWZDTWNvU21zbDI3ZGpGQ1FqZHArK2dmcmo1SGpGNHV5SmVnOUtLbURlUkdU?=
 =?utf-8?B?cFBjRXY1VytlUklJaW9YYVNBSWRvNTIwWHBjWGNVdi9MYmlwUWQwU3d4L0RE?=
 =?utf-8?B?a3p2OHBXbE4wSWE1aVk5UnJTTTdpRm1MNWg2UTRJcy96dngwZE9XbURVSmxq?=
 =?utf-8?B?T1VpS29XMWo1K01IRGk3SEdyM3VLNzg4U0RDZlN2cjlHZTV4ZlNqK3h6dTZl?=
 =?utf-8?B?NS96ZjR6VWZWR2hObm9aK25DREdjeWdFVlM0N1QrZUs2QUlhNitFc2RQYW1v?=
 =?utf-8?B?c2s4amVaY1NzaHB1MkZjY2pYN3pVS0VSZys1QU9UT3ZZMFhxbk5MZEVRNXFZ?=
 =?utf-8?B?b3B0UmpLeUIwYXl3SGhTVDhQbWphTFNtZ2QyeVFPZHM5THlWdlBjVXNSUVIv?=
 =?utf-8?B?bWdBNFVVVHVXTHZkUEtPSG82UXN5ME1XSjlURDFQU2FQYnpXeWxMV3g5bG1Z?=
 =?utf-8?B?K3pkTnZZeXdCN1RMN2hVcjUxbWxXT1JIUTNxeGxlVEJ0cTZJZ0dTWWRNRTB5?=
 =?utf-8?B?Q3plb1V4Y0tJZnZ4TFNBNDVMWmgyNkdXYjE1MmR3SVNFS2JmZGZDUm5zNS9J?=
 =?utf-8?B?WlY0UGJMcW53dWNEWkRaTmc1U0ZjRjhkbmp4V1JUMXl1Nnhrem9iL3p5bnFn?=
 =?utf-8?B?MGZydTEvaHdwRWZrWnZvK253eTV5OENwMGloOEM1bjVnTUNraDFiQXkxZFpj?=
 =?utf-8?B?OUVpVmlkRHZaWU1nMFhCclplcWxjZDVXQjF3d0FxeFh6eXREMVF2a3NUNzIv?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0d3032-783a-4d07-0893-08ddc4deffb2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 03:07:01.0446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kr1XA5JK9TwpBpgnytuWBZtMSFpraselCRKAgi4gO2gijDpUYg5wT2xoMGCNgPn6L9ytG+Akvhs3qBgjSGqis7wvD6W+asse9m3y2AGxjj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6850
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_200719_750969_05D8833B 
X-CRM114-Status: GOOD (  23.71  )
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

CgpPbiAyMDI1LzcvMTcgMDA6MjUsIERhIFh1ZSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0K
PiAKPiBPbiBXZWQsIEp1bCAxNiwgMjAyNSBhdCA1OjMw4oCvQU0gWGlhbndlaSBaaGFvIDx4aWFu
d2VpLnpoYW9AYW1sb2dpYy5jb20+IHdyb3RlOgo+Pgo+PiBIaSBNYXJrLAo+Pgo+PiBPbiAyMDI1
LzcvOSAxNTowMiwgWGlhbndlaSBaaGFvIHdyb3RlOgo+Pj4gSGkgTWFyaywKPj4+ICAgICAgVGhh
bmtzIGZvciB5b3VyIGFkdmljZS4KPj4+Cj4+PiBPbiAyMDI1LzcvOCAyMTo1MCwgTWFyayBCcm93
biB3cm90ZToKPj4+PiBTdWJqZWN0Ogo+Pj4+IFJlOiBbUEFUQ0ggdjQgMi8zXSBzcGk6IEFkZCBB
bWxvZ2ljIFNQSVNHIGRyaXZlcgo+Pj4+IEZyb206Cj4+Pj4gTWFyayBCcm93biA8YnJvb25pZUBr
ZXJuZWwub3JnPgo+Pj4+IERhdGU6Cj4+Pj4gMjAyNS83LzggMjE6NTAKPj4+Pgo+Pj4+IFRvOgo+
Pj4+IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+IENDOgo+Pj4+
IFN1bm55IEx1byA8c3VubnkubHVvQGFtbG9naWMuY29tPiwgUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4sCj4+Pj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPiwg
Q29ub3IgRG9vbGV5Cj4+Pj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+LCBsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcsCj4+Pj4gbGludXgtc3BpQHZnZXIua2VybmVsLm9yZywgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmcsCj4+Pj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA2OjM0OjAyUE0gKzA4
MDAsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4+Pj4gT24gMjAyNS83LzcgMjE6MDUsIE1hcmsgQnJv
d24gd3JvdGU6Cj4+Pj4+PiBJcyBpdCB3b3J0aCBoYXZpbmcgYSBjb3B5YnJlYWsgc3VjaCB0aGF0
IHNtYWxsZXIgdHJhbnNmZXJzIGFyZSBkb25lCj4+Pj4+PiB1c2luZyBQSU8/ICBXaXRoIGEgbG90
IG9mIGNvbnRyb2xsZXJzIHRoYXQgaW5jcmVhc2VzIHBlcmZvcm1hbmNlIGR1ZSB0bwo+Pj4+Pj4g
dGhlIGV4dHJhIG92ZXJoZWFkIG9mIHNldHRpbmcgdXAgRE1BLCB0YWxraW5nIHRvIHRoZSBETUEg
YW5kIGludGVycnVwdAo+Pj4+Pj4gY29udHJvbGxlcnMgY2FuIGJlIGFzIGV4cGVuc2l2ZSBhcyBk
aXJlY3RseSBhY2Nlc3NpbmcgdGhlIEZJRk9zLgo+Pj4+PiBJZiB0aGUgZGF0YSB2b2x1bWUgb2Yg
YSBzaW5nbGUgdHJhbnNmZXIgKHhmZXIpIGlzIHNtYWxsLCBQSU8gbW9kZQo+Pj4+PiBkb2VzIG9m
ZmVyCj4+Pj4+IHNvbWUgYWR2YW50YWdlcy4gSG93ZXZlciwgc2luY2UgUElPIHJlcXVpcmVzIHRo
ZSBDUFUgdG8gd2FpdCBpbiBhCj4+Pj4+IGJ1c3kgbG9vcAo+Pj4+PiBmb3IgdGhlIHRyYW5zZmVy
IHRvIGNvbXBsZXRlLCBpdCBjb250aW51b3VzbHkgb2NjdXBpZXMgQ1BVIHJlc291cmNlcy4KPj4+
Pj4gQXMgYQo+Pj4+PiByZXN1bHQsIGl0cyBhZHZhbnRhZ2VzIGFyZSBub3QgcGFydGljdWxhcmx5
IHNpZ25pZmljYW50Lgo+Pj4+IFRoZSBDUFUgb3ZlcmhlYWQgdGVuZHMgdG8gYmUgaGlnaGVyICh5
b3UgY2FuIGF2b2lkIHNvbWUgb2YgaXQgd2l0aCBhCj4+Pj4gZGVhZCByZWNrb25pbmcgc2xlZXAp
LCBidXQgdGhlIGxhdGVuY3kgdmFzdGx5IGltcHJvdmVkIHdoaWNoIGZvciBtYW55Cj4+Pj4gYXBw
bGljYXRpb25zIGlzIGEgd29ydGh3aGlsZSBhZHZhbnRhZ2UuICBJdCB0ZW5kcyB0byBiZSB0aGlu
Z3MgbGlrZQo+Pj4+IGFjY2Vzc2VzIHRvIG9uZSBvciB0d28gcmVnaXN0ZXJzIG9uIGEgZGV2aWNl
IHdpdGggcmVnaXN0ZXJzIHdoZXJlIHRoaXMKPj4+PiB3aW5zLCAxNiBieXRlcyBvciBsb3dlciB3
b3VsZCBiZSBhIGNvbW1vbiBudW1iZXIgb2ZmIHRoZSB0b3Agb2YgbXkgaGVhZC4KPj4+Pgo+Pj4+
PiBJZiBQSU8gaXMgdG8gYmUgaW1wbGVtZW50ZWQsIGl0IGNhbiBvbmx5IGhhbmRsZSBvbmUgdHJh
bnNmZXIgYXQgYQo+Pj4+PiB0aW1lICh2aWEKPj4+Pj4gdHJhbnNmZXJfb25lKSwgYW5kIG5vdCBl
bnRpcmUgbWVzc2FnZXMgKHdoaWNoIGNvbnNpc3Qgb2YgbXVsdGlwbGUKPj4+Pj4gdHJhbnNmZXJz
KS4gSW4gY29udHJhc3QsIHdoZW4gcHJvY2Vzc2luZyBtZXNzYWdlcywgdGhlIFNQSSBjb250cm9s
bGVyCj4+Pj4+IGNhbgo+Pj4+PiBoYW5kbGUgdGhlIGVudGlyZSBzZXF1ZW5jZSBpbiBvbmUgZ28s
IHdoaWNoIGFsc28gcHJvdmlkZXMgY2VydGFpbgo+Pj4+PiBiZW5lZml0cy4KPj4+PiBJdCdzIHBy
b2JhYmx5IHdvcnRoIGFkZGluZyBzb21ldGhpbmcgdG8gdGhlIGZyYW1ld29yayB0byBiZSBhYmxl
IHRvIHRha2UKPj4+PiBhIGRlY2lzaW9uIGF0IHRoZSBtZXNzYWdlIGxldmVsLCBmb3Igd3JpdGVz
IHRoaXMgdGVuZHMgdG8gYWxsIGZhbGwgb3V0Cj4+Pj4gbmF0dXJhbGx5IHNpbmNlIHRoZSB3cml0
ZSB3aWxsIHRlbmQgdG8gYmUgYSBzaW5nbGUgdHJhbnNmZXIgYW55d2F5Lgo+Pj4KPj4+IEkgd2ls
bCB0cnkgdG8gYWRkIG5ldyBBUEkgbWVzc2FnZV9jYW5fZG1hIGZvciBmcmFtZXdvcmssIGFuZCBp
bXBsZW1lbnQKPj4+IFBJTyBmb3IgbWVzc2FnZS4KPj4+Cj4+Cj4+IEkgdHJpZWQgdG8gaW1wbGVt
ZW50IFBJTyBtb2RlIGluIHRoZSBkcml2ZXIsIGJ1dCBpdCB0dXJuZWQgb3V0IHRvIGJlIHRvbwo+
PiBzbG93LiBEdWUgdG8gdGhlIGxhY2sgb2YgYW4gaW50ZXJuYWwgRklGTywgZGF0YSBjb3VsZCBv
bmx5IGJlCj4+IHRyYW5zbWl0dGVkIG9uZSB3b3JkIGF0IGEgdGltZSwgYW5kIGVhY2ggdHJhbnNt
aXNzaW9uIHJlcXVpcmVkCj4+IHJlY29uZmlndXJpbmcgdGhlIGNvcnJlc3BvbmRpbmcgcmVnaXN0
ZXJzLiBBcyBhIHJlc3VsdCwgdGhlIGVmZmljaWVuY3kKPj4gd2FzIHF1aXRlIGxvdy4KPiAKPiBP
bmUgb2YgdGhlIHVzZSBjYXNlcyBpcyBmb3IgU1BJLWJhc2VkIGRpc3BsYXlzIGFuZCBpdCB0cmFu
c2ZlcnMgb25lCj4gd29yZCB2aWEgUElPIGFuZCB0aGVuIGEgbG90IG9mIHdvcmRzIHZpYSBETUEu
IEkgc2VlIFBJTyBhcyBiZW5lZmljaWFsCj4gZm9yIHRoaXMgY29tbW9uIHVzZSBjYXNlIGZvciBT
UEkuCj4gVGhlIGVmZmljaWVuY3kgZG9lcyBub3QgbmVlZCB0byBiZSBoaWdoIGZvciB0aGlzIG9u
ZSB3b3JkIGJ1dCByZWR1Y2luZwo+IHRoZSBsYXRlbmN5IGZvciBETUEgc2V0dXAgaXMgYSBzaWdu
aWZpY2FudCBnYWluLgo+IAoKRm9yIHRoZSBuZXcgU1BJU0cgZHJpdmVyLCByZWdhcmRsZXNzIG9m
IHRoZSBtb2RlKFBJTywgRE1BKE1FTSBvciBzZyksIAp0aGUgY29uZmlndXJhdGlvbiByZWdpc3Rl
cnMgYXJlIHRoZSBzYW1lOyB0aGUgb25seSBkaWZmZXJlbmNlIHZhbHVlICBpbiAKdGhlIG1vZGUg
c2VsZWN0aW9uLiBzZWUgcmVnIGNmZ19zdGFydC4KCj4+Cj4+IFRoZSBvbmx5IHNpbXBsaWZpY2F0
aW9ucyBwcm92aWRlZCBieSBQSU8gbW9kZSB3ZXJlIGluIHR3byBhcmVhczoKPj4KPj4gMS4gVGhl
IGFsbG9jYXRpb24gYW5kIHJlbGVhc2Ugb2YgdGhlIHRyYW5zZmVyIGRlc2NyaXB0b3IKPj4gMi4g
VGhlIERNQSBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgcHJvY2Vzcwo+Pgo+PiBUaGVyZWZvcmUsIEkg
c3VnZ2VzdCBub3QgaW1wbGVtZW50aW5nIFBJTyBtb2RlIGluIHRoaXMgZHJpdmVyLiBJIHdpbGwK
Pj4gZG9jdW1lbnQgY2xlYXJseSBpbiB0aGUgY29kZSB0aGF0IFBJTyBtb2RlIGlzIG5vdCBzdXBw
b3J0ZWQgYW5kIGV4cGxhaW4KPj4gdGhlIHJlYXNvbnMgYmVoaW5kIHRoaXMgZGVjaXNpb24uCj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
