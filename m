Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4660EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 02:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc7A3tPNzjePL631HDqGYvj2CYDJhUrgj3nuNQ70DK0=; b=goATJUaLETsLcp6PC5vwIb1r7l
	fkRVqIpuxNWvgWXyhM3gHq4YCMBEOHjz7Oa7966eqNPSUnPQ4TEkJguVNlcuoOIJbyTiyaGmMlJou
	blGs4/KQ4B+IRLFBbiLCyScu3o3lnr9NKeqNUnoOgkkpxnQ/iOFXpvb1OY/u8R5H9RAnByU4bqnqf
	+I+V2N4cQ4wC6d9gB4XsZJOp/nq8LnVyx5J3Ujy7GazPlY4sJTT1rkwtS/VyAU/A6Deje4qR3ahiW
	TN808HT5GatrQRhPnistSBf2iOoxgaw/zPU6v1mGm5J1ZFDSJ57wPkUiKXt6h/SS52A7BVGOY+bt/
	SA+BJ0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3m8-002hL5-0G;
	Fri, 30 Jun 2023 02:22:20 +0000
Received: from mail-psaapc01on2071d.outbound.protection.outlook.com ([2a01:111:f400:feae::71d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3m4-002hK8-0d;
	Fri, 30 Jun 2023 02:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi36LLM5zBzQ+uUIzFLA+W5RymdovLw6+muV0CUAOTxvvGdR82/79dP5QzcoG2CNba1L4nInnyyIUS0lCo7beC2F5QtvCqZqs5Y5bIfsTOgunAklxFjFSxmW3v/LATl57/mUW1ouKObu5gEV6ef7LA6TEhOTlg2quPEQl8bShSEg/YFTEypPjr2a/Kqj46HyWLy/zhxWa0FcPPDD1GDxsmiIIM0NN1fSseYsz9qafnTbIdBg/thOK6PDFOUyIAIgexh1TMbUlF0af3zxENrY5Hvggh0HTjq4TYTFTeTlX+zmlpJhY3CzBGsmbg+ZVAjXeXlA48qullrwbUqQfCUwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0w9AJ2mnjEmNTjuc8SnDGhajtMJ/KdiuL/7nNAlXAQ=;
 b=A/x0hZtxfCU/Nk3lkmGDExotcs5rfKETULWjTvHhdzEPZcGI54b4V2E5sSpo48XNxZl9zzsfhg5MDqBToEtbQdUds0X0UBwGwpsXOIKFKYyQNWL8mNkO4ACl1QTB9cdY0gEh6Rs7FXqxqbqsJOc7YLDva4iQE/dTVdUt3MKDRKGzILx9vYdY4ye7CJtosYEV+cBgCPrVQ8SAN4UI/WrTt3T/9ytOQrh8Sz/aGcqlo3KnWnOvrdUCk6cNXGAGeBzYOf2vO58gJVL8+yRFx+Stl0qQGOcLNig+z9vv1dizqcf10QhB3YJ5KBBclTdPo4mZly1r/GZ0xcCqnLsXAgKReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0w9AJ2mnjEmNTjuc8SnDGhajtMJ/KdiuL/7nNAlXAQ=;
 b=vS3ArCQ8GipcBpXC6Emxc1JriGs97Nzu231EHAzFdjTx6I8MXzTVhQXxcBovAPjAgG6REKg57nZ+BwENuXUPHWPvjtVDxjctmUkNtgRtDzGQqEibGloMkLMrMANpq4XOEwk+w/jFVhdexp2++0s4NrmASy8+QYe9ZRXv2Kg8HKTSNjJYn+z8COZBE+AdIBNu1W7MplH3V2IyzEbOfurwBE+hZLvMabgKxkrtpgL9yH3JG454ifIbiA3IVHgIYO0HFieAf3KkTIz1IaueLGEeJOMfanXCdEuLw/deEFkj9gvforX8C+ZKXOKYD0/xu5054BVG/caP8js6d9rv5iCFJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SI2PR03MB5915.apcprd03.prod.outlook.com (2603:1096:4:147::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 02:22:01 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::e659:543b:2ac9:8fd7]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::e659:543b:2ac9:8fd7%3]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 02:22:01 +0000
Message-ID: <0b4b67aa-e8f5-2bd9-223b-0f26add687fe@amlogic.com>
Date: Fri, 30 Jun 2023 10:21:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] Baisc devicetree support for Amlogic T7
Content-Language: en-US
To: tanure@linux.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626-viewless-marrow-17838c2172f6@wendy>
 <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
 <20230627-unsure-uniformly-079cad2c26e6@wendy>
 <061bb829-fb75-d154-0c15-9f0f982fec41@amlogic.com>
 <CAJX_Q+0Kf3zFyUtkCEkm7K8zXwaovxQmo1DWFwy8y25GQ2wqXg@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAJX_Q+0Kf3zFyUtkCEkm7K8zXwaovxQmo1DWFwy8y25GQ2wqXg@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SI2PR03MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 781e95ba-6ec0-4493-b594-08db7910c8fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rlc2VKhL9Jdgnwc0//EI7HYkHMuiSK5v1bwJ5f4h96aF0CEYtQic55ldZ/3yZhK2xaYDnwzNZ6asmDt4T51LixB/fn0bWJOJ5lWbvYiz/0L7pKZPyPUBggpMkWlPgDHJaq9PW2nYhgTfWDi2CJSSE8+NZVq7p/TGT4Uc0YVsfXKNkr2P4jBRgEFCRcWwu0+NPsf3LMSwU4KnqeONucq3ipzmpUMej6xW1D04IB8ZTGJaLxBRZF4qE6G7rkZBcXiNxI/BoqJefv69wa1/wnG5xCke0N6FWCWpbE4+jSpbnoYF/ZgtRJtX9Zpx1n0BWDSVm9rMN7a4s9fIMS0efCViPt57hhopbIgUpm5Nk6+8CkkNIpPjW5GFbWPN0lWmMnd4PEjJd++xLxbXozCnSF0/8T2j6NnRz1AGG9DCwL/AR+2iRXL2pBC03ib0xQyV92ktDvzpUoqEQ+qoonRC0nBgcwKHWdwkavY1CHqMkCjWIx66tlXSs5G9JBF5lZ8b6xp50BL9JGMbpS97UW4ciAKmKtvgcYql3ynoDSj1x6tY31PDOxWmd6/ORlWK1I8UFUrzqUdDT9KVPLWNmsfs6Kfig/tOxIouuNKT/9V2Ze8J6lppoJs7Bo/S5xTq4fu+AFZetBzZmYejbksIeGCsyVhO0xxmMkEiGaPYrsbZIIszmDCw6dAefl0qhR6grUJUAScV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(31686004)(6506007)(7416002)(5660300002)(44832011)(6916009)(66556008)(4326008)(316002)(66946007)(478600001)(36756003)(66476007)(8676002)(8936002)(2906002)(186003)(54906003)(966005)(31696002)(41300700001)(6486002)(53546011)(86362001)(6512007)(26005)(2616005)(6666004)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmRGWmJHWEF4cU0vUm5sWXlKSXVFYUp6MzByNVBRU0pWSkpkdWpmd2Z2TURN?=
 =?utf-8?B?ZDRmU1RHZ0lxaGw1Z1I3em1nZ1BpNG1LVE1XZE9XUU1SaUdRK2MweUY2THVa?=
 =?utf-8?B?ZThXK3o5SVZuLzE5TndMcm5UbHA2cHZ5UmRKV014MW9vVUZHY1pIM29YU0FH?=
 =?utf-8?B?SVY2MFdsL1I2NTFYcnBiZTM4blJ3dXkvTE5vWi84aEgzVUJ5SGd3K2RxR0w4?=
 =?utf-8?B?QkxrZjBLZVRhaldRVnduYkFkVkM0WXZGbnlrTTcvR3p1bnUvM09QQUs5MmtC?=
 =?utf-8?B?UDNQRG9UNEFXb0s0L25tQ3NXdHNWbkgzazMyREwrYmlMb3dTZURMWkU5TmZX?=
 =?utf-8?B?cnZpSVBoQW9uWVdORnc1NXptSDRDZWxYWGkyRy9pWHBKN0VUUFNQSHdJMjF1?=
 =?utf-8?B?ck96aU9LOHF5akZyMitSYWlEaHNTd2ppb3FIRlc1bm9wQkxwN2ZtWlkvQWRP?=
 =?utf-8?B?a3RzQVRrRHc3bGsrNEtsMllFdVQ4Wm9lYUZEYTY2VHpBZEJTZXhzMkJzOVJF?=
 =?utf-8?B?SzZIZU9OeWs3NDJ3VjJOdndvcnZrVTQzd3duRlgvQ0kxZWRtR0ZwZDE2ZHVr?=
 =?utf-8?B?SkkwZktxRnFiU0hwdisvc1dZZUpsSTJkNXhTYTR5NkMveXRvUS9TM1BLaFhs?=
 =?utf-8?B?cnRFTFd1L1pLNHBSSTVUVFZXUHFTcWNtdFNCdmwzbTJFSDBMbDhXc0pVRFd6?=
 =?utf-8?B?VUdXU3dDaHNrT2puMWlQa0ZOUzJPZkZzMytiZURDQWd5T0YyM3k4TVo3cjBB?=
 =?utf-8?B?bXprWUVCZTBJRzJja2dIaGh0U1JCaEZMb0JGTS9NYkNYVDJOci9Za3dZZzh0?=
 =?utf-8?B?VExwNTlpTlYybDlkNmszdTNhb0pYWUpweXJQS09MRENQa3hvaUxzeVZCN01O?=
 =?utf-8?B?ZnR2eW9UdW9sV0s0V2ZET3dkUGU2SkF4YU5mc25kdGNPaFVKZ2FhWWsxN21o?=
 =?utf-8?B?eHJDbGZoYjZrRHAySTNSTm8yVkVHOGRSQUZSTDV0Z3dDRkVzMWNPdkd5eDFx?=
 =?utf-8?B?SjQyOTR5akxSY0JBWXlCaGdkREZqZFpSaTZEWUpzZjhJeFJyYzY0eTB3Rjky?=
 =?utf-8?B?QXVYdnN5T2JoNjRLWVUxdTlZdVNNTFdmdDM0WDRTTHZ4REV5QVhKbXBaRWlM?=
 =?utf-8?B?K29oZmF1MFhjU1pQTDNDSVQ3VmJMZTRjWjZBa3krMHA5NXZpZ2tINlFDTTBI?=
 =?utf-8?B?N2p5d0M4dzl3MXQyc2MwZGEvdHZBSEtlc1pQbzVXS1pmd3FSRGZTV1FyQW94?=
 =?utf-8?B?TEMwU2pVSU9nQmNQWmdNYkp3OVNabUxTRzVsYmVOeHZnWGJEUmFNUGxFVllG?=
 =?utf-8?B?L0RON1dUNDZpbFV2MUozUmszNTJDRmhiN0JPQ04zT3IvMXE3eHNKQXRyS1Bh?=
 =?utf-8?B?Q3N6VGZrK0t5UmdmanZVZlBNK1dEV2xFbHpuUjAvUWg1RTQzL0VYeFRodEhO?=
 =?utf-8?B?bXAwNUVsUVVZMjVtWHNaWVdGcmE0WThTQ3RzNFoyTitqcjZCTGZIOVBpaGU3?=
 =?utf-8?B?M3F3eVRxdFVyYjVuUGNPRXhOVlRTM0xtNWRYb1J3S2xLNjk3RjdXNGtNYUVi?=
 =?utf-8?B?NlVCMnlMamFQSlpwTW9PVURGRlo4UmpKdmhGOUNpWnovTEF2YUdxczZYZ3lr?=
 =?utf-8?B?bjRQaWJIWW56UnZxelNGU24zckU4S1F1WTJSR1E2ZTBqNDVmSG5NSzZ3Uzlo?=
 =?utf-8?B?SWtoSWVqRzEzT2MvWjJUVTJnT0VKbEZNUXpjRmhDb2ZYR0lKNlFKL1BNY2tZ?=
 =?utf-8?B?aG1QMTJRN015NkFmMXMvQUFwSmY3WjNCV1V2d3R3UDVMaGhMT3NobEVGN0ww?=
 =?utf-8?B?MytRbDBPTDhJQk9BRndoMDFzeUJ0M3ZGcUsyV2tQMXRyZmcxWk12b2tDei9j?=
 =?utf-8?B?K3VEYWpNRTNCcHZDWHJFUjYxS1VqVDdQaitIRWNqWlg1c3JoUlF1QlIxU0dO?=
 =?utf-8?B?WkN5UzF0RlYwYlBBMmlIaDVGWkQ3bjlKY2NNeXJLUVFjTy94cDVVbUVlYlJ4?=
 =?utf-8?B?VUpYSWFtMVh1SVR3c1hJc1pIbE5ONFdSOFVwWTc1c25tNmhjOTdpMzlhVXdZ?=
 =?utf-8?B?eVhqUEZySjdZZUNpV3E2SFhKK2xSS2lRbEJ2Y3F5MXpTZXIyTHh0bXUzTDN2?=
 =?utf-8?B?MTRxTG5XazJXam9iM2pwTSszRlhqcEdnSEc4YjMxNXhtU3BVYW9ZcUxEWTNE?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781e95ba-6ec0-4493-b594-08db7910c8fe
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 02:22:00.5715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o9hsY8M4Ji4AFfRHFwdbWTMGkWFin0S0FQQ/coVJ8WpfAuLNqRZ9VvW3+qClfGEqC3QfeBlfgWCIqVlf812LGy9No3H+pClkOnRX48S9vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_192216_272672_835AEDB0 
X-CRM114-Status: GOOD (  25.33  )
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

CgpPbiAyMDIzLzYvMzAgMDA6MzMsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPiAKPiBPbiBUdWUsIEp1biAyNywgMjAyMyBhdCA4OjUy4oCvQU0gWGlhbndlaSBaaGFv
IDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+IHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDIzLzYvMjcg
MTU6MjMsIENvbm9yIERvb2xleSB3cm90ZToKPj4KPj4KPj4gICA+IFsgRVhURVJOQUwgRU1BSUwg
XQo+PiAgID4KPj4gICA+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDAyOjEzOjM0UE0gKzA4MDAs
IFhpYW53ZWkgWmhhbyB3cm90ZToKPj4gICA+PiBIaSBDb25vciwKPj4gICA+PiAgICAgIFRoYW5r
cyBmb3IgeW91IHJlcGx5Lgo+PiAgID4+IE9uIDIwMjMvNi8yNiAxODowMiwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+PiAgID4+Cj4+ICAgPj4KPj4gICA+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+ICAg
Pj4+Cj4+ICAgPj4+IEhleSwKPj4gICA+Pj4KPj4gICA+Pj4gT24gTW9uLCBKdW4gMjYsIDIwMjMg
YXQgMDU6NTI6MjFQTSArMDgwMCwgWGlhbndlaSBaaGFvIHdyb3RlOgo+PiAgID4+Pj4gVDcgaXMg
YW4gYWR2YW5jZWQgYXBwbGljYXRpb24gcHJvY2Vzc29yIGRlc2lnbmVkIGZvciBzbWFydCBkaXNw
bGF5Lgo+PiAgID4+Pj4KPj4gICA+Pj4+IEFkZCB0aGUgbmV3IFQ3IFNvQy9ib2FyZCBkZXZpY2Ug
dHJlZSBiaW5kaW5ncy4KPj4gICA+Pj4+Cj4+ICAgPj4+PiBBZGQgYmFzaWMgc3VwcG9ydCBmb3Ig
dGhlIFQ3IGJhc2VkIEFtbG9naWMgQU40MDAgYm9hcmQsIHdoaWNoCj4+ICAgPj4+PiBkZXNjcmli
ZXN0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVyLCBVQVJULiBJ
dCdzCj4+ICAgPj4+PiBjYXBhYmxlIG9mIGJvb3RpbmcgdXAgaW50byB0aGUgc2VyaWFsIGNvbnNv
bGUuCj4+ICAgPj4+Cj4+ICAgPj4+IEx1Y2FzIGhhcyBhbHJlYWR5IHNlbnQgcGF0Y2hlcyBmb3Ig
dGhlIFQ3IFNvQyAmIGlzIGF0IHY1Ogo+PiAgID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1kZXZpY2V0cmVlLzIwMjMwNjIzMDgxMjQyLjEwOTEzMS0xLQo+PiAgID4+PiB0YW51cmVA
bGludXguY29tLwo+PiAgID4+PiBUaGVyZSdzIGJlZW4gYSBiaXQgb2YgZGlzY3Vzc2lvbiB0aGVy
ZSwgYW5kIHRoZXJlIHNlcmlhbCBzdHVmZiBpbgo+PiAgID4+PiBwYXJ0aWN1bGFyIGlzIGRpZmZl
cmVudCBpbiBoaXMgc2VyaWVzIChpdCBkb2Vzbid0IHVzZSBhbHdheXMtb24gZm9yCj4+ICAgPj4+
IGV4YW1wbGVzKS4KPj4gICA+Pj4gQ291bGQgeW91IHBsZWFzZSBnbyBhbmQgdGFrZSBhIGxvb2sg
YXQgaGlzIHNlcmllcz8KPj4gICA+Pj4KPj4gICA+Pj4gQ2hlZXJzLAo+PiAgID4+PiBDb25vci4K
Pj4gICA+Pj4KPj4gICA+PiBBTjQwMCBpcyB0aGUgcmVmZXJlbmNlIGJvYXJkIGRlc2lnbmVkIGJ5
IEFtbG9naWMsIHdoaWNoIGlzIGRpZmZlcmVudAo+PiAgID4+IGZyb20gS2hhZGFzIFZJTTQuCj4+
ICAgPgo+PiAgID4gWWV0IHlvdSBzaGFyZSB0aGUgc2FtZSBkdHNpLCB3aGljaCBoZSBoYXMgZ290
IHRocm91Z2ggc2V2ZXJhbAo+PiAgID4gaXRlcmF0aW9ucyBvZiBiZWZvcmUgeW91IGFycml2ZWQu
Cj4+ICAgPgo+PiBIaSBMdWNhcywKPj4gQXJlIHlvdSBnb2luZyB0byBjb250aW51ZSB3aXRoIHRo
ZSBkdHNpIHBhcnQ/Cj4+Cj4+ICAgPj4gQW5kIFQ3IHNlcmlhbCBpcyB0aGUgc2FtZSBhcyBTNCwg
c28gSSBmb2xsb3cgUzQgc2VyaWFsLgo+PiAgID4KPj4gICA+IFllYWgsIG5vLiBTb0Mgc3BlY2lm
aWMgY29tcGF0aWJsZSBwbGVhc2UuCj4+ICAgPgo+PiAgID4KPj4gICA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+ICAgPiBsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdAo+PiAgID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+ICAg
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMKPiAKPiBIaSBYaWFud2VpLAo+IAo+IEkgYW0gZG9pbmcgdGhlIGJhc2ljcyBmb3IgQW1sb2dp
YyBUNyBBMzExRDIsIGJ1dCB0aGUgbmV4dCBzdGVwICggc2QKPiBjYXJkIG9yIGVtbWMsIHNvbWV0
aGluZyB0byBib290IG9uKSB3b3VsZCBiZSBtb3JlIGRpZmZpY3VsdCBmb3IgbWUKPiB0aGFuIHlv
dS4KPiBBZnRlciB0aGUgZmlyc3Qgc2VyaWVzIGZvciBWaW00IGdldHMgbWVyZ2VkLCBJIHdpbGwg
c3RhcnQgdG8gd29yayBvbgo+IGhvdyB0byBnZXQgc2QgY2FyZHMgd29ya2luZy4KPiBCdXQgaWYg
eW91IGFscmVhZHkgaGF2ZSB0aGF0IHdvcmtpbmcgZm9yIHRoZSBBTjQwMCBib2FyZCwgcGxlYXNl
IHNlbmQKPiBpdC4gQW5kIEkgd2lsbCBsb29rIGF0IHRoYXQgd29yayBhbmQgdXNlIGl0IGZvciBW
aW00Lgo+IAo+IE9yLCBpZiB5b3UgZG9uJ3QgaGF2ZSBpdCByZWFkeSBhbmQgd2FudCB0byBzaGFy
ZSBpdCB3aXRoIG1lLCB3ZSBjYW4KPiB3b3JrIHRvZ2V0aGVyIG9uIHRoZXNlIEEzMTFEMiBwYXRj
aGVzLgo+IFlvdSB0ZXN0IG9uIEFONDAwLCBhbmQgSSB0ZXN0IG9uIFZpbTQuCj4gCj4gVGhhbmtz
Cj4gTHVjYXMKCldlIGFyZSBwcmVwYXJpbmcgdGhpcyBwYXJ0LiBIb3dldmVyIGl0IGRlcGVuZHMg
b24gY2xvY2suIFNvIHRoZSBjbG9jayAKbXVzdCByZWFkeSBmaXJzdC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
