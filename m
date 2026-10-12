Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93663CA9ED1
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSl5nMo0gqEjiAKJz5Ysu7BtsbwnP7B/iS9SmNHFdjE=; b=fvQlPuMNFnKmOd
	Lkvzjl+Gbl9ae3iCMpz2gMf9yJnRMeWpj+3ZRxAiOkKPsoDOLWV5m7wFoaXt7H2F5ozLQNrgBQ1AB
	BvqcgCLG7YSA0u/tFPLk3viukKxa6BXt3HGBIhI23fCvEbrWDWxgJdnZX11WYnd3R7HtDlqMSQJKy
	J6nFn1Ftq2Mc9ZZ+SbM351PM4+HfXi8voYQMSJFoxSMDJPoc0DxcU1yXc7FWqrz5z1IFp92qpLwPQ
	y9c8vepG0StdLtcp+qK/Bh4dTEvJwPrCACCQzpBCcDSNvJhxfREE+GCVordKFYlI/UnILNFQOkXfD
	+YY1Qa3EV9DbVeCuWZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGInX-0000000Ax4R-0GHF;
	Mon, 12 Oct 2026 16:22:47 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGInU-0000000Ax2z-3O1U
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 16:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wd6BgjEa8E7pM5Az+WTBmDDaJp4MmFTu1NmhnOvv4XI/1ZlFCmEcDeAsu171cenom075kfpC5CoZJdzNvkUHxuAc3bozEP/DVmH+YzpQnFR1Yt5yUYaYzJEPM2MXUKe8RXAZOzUrQguuMpIiHYIGGcAfU6b3VJYuUPKj3atGIiEd7oIWk+Rbd/au/XR883dhqIcexY/he9xOH7Cm8+FoR28ucn/la/jxolP3XIZsY04BJAOhE1x9wSfYUuYuAGHCqS2UFSil5XIAhwSE4gkKjEuh3KaaBzpXLtn9ME01yx7iaXnasFHumu0+Wt5x8dkR3SKLUTHBmh39HO2iZZ8GgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiHg9vMz+s73KEYqXF9WVpYQzW9HvxCQVzlk5sSp7SQ=;
 b=hb9DOQF1EmifgvcxY0X+jiOiz5E0qB1Z6OL6gpouYDVCnLGSImPuTevuDcrOf/XbRW3+nf/XzmwH7np07O7opU+oyBkwCZZgYv2OxisY5C3kd3um8z3DBdMPpKf9FYAw1sZKQa4euiLEco1NDvyBtSitiLwOQRPisOIot98c+6XiM/97ANkw9is9hZxMV5e2Y/5D9k0CkQVi9iMkX2u3wA5orfqxJ42qTDEV9P74at7Z/++XwwiulTWSMl6eFrv/3z7GitDkMA7dqobTYSweK8h0uE/auHiRZCQG53V5KvypxpD971+LDPxK0orqJ5Epl281vIgGix0xl1doVvH66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiHg9vMz+s73KEYqXF9WVpYQzW9HvxCQVzlk5sSp7SQ=;
 b=LNolCgJvS4683j3iwL/VHwJZ+skMsvF0MYWu87x20vKlc7iUwAH4DB8ATsKOMCQlAp1xusKWFJ2FeWsXFJcEaIRC+x+mTjwOP7r+D72Z3mXjo/Ge+fT4kqIGYobsQVLQMSRWuWQ8Ocl57FHJ1iB4hDn/JKkH+Sht16pXkGDPJJd6cgdPkfTfU9lSkxPE459O2FGb3633ZqWoBR9WwowHd6wa0eYHVKOfCp3zpcmHqnKqB2dnbvezcqKzf1lbvU6l+OesCCrMfYQne9qc8io+EatT8jx/2+FwvH24w/cmymT4EbkujJwxnn5i8Fm4re9fcVJo4sjWQcei5MqNSi9+3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10778.eurprd04.prod.outlook.com (2603:10a6:150:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 16:22:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 16:22:36 +0000
Date: Mon, 12 Oct 2026 11:22:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: xianwei.zhao@amlogic.com
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dma: amlogic: Fix little-endian variable operations issue
Message-ID: <as0JRBU01QWrpwnj@SMW015318>
References: <20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com>
Content-Disposition: inline
In-Reply-To: <20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com>
X-ClientProxiedBy: CY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:930:1e::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10778:EE_
X-MS-Office365-Filtering-Correlation-Id: 534dcd83-0a15-46df-d397-08df287d06c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 1JoD16/RV7GIknPtdkphK5eS6/6Xpq1Xv7/cw00UA467aGGdpqt256eyMSjorXxCizL1FlkvWyVqX1FrpvABxYMqLhcSPRM9SX03AxJt2bPuddSy4OR8GvuZ5jDSwJ2dM16KCfECYDSVBkombcIsRuuhoG0XRdpiROwFqgHWQjiwpTbR/b8WsXOvShbL4/IWh2k9GOEBfV065D58ABTqvNGS5M+hWJRbVPmvVfBOqFnPs53lVXLMETNFMVO0oyfYcwCTc5DRQtdAwEKf0KgkEto1siOltPDKUVPpkeu/ag0uyGGkpnoQajAH1mWkdA1mMJBtFKJpz/yZ5ZtAGQK3wMl8CuvA4UzA0DnGeIqZLA3W6POfMsdxjhYtwU9bFNn0ZjvJLicHqzmmTdrCs7ElLaX6f02sfX24eFD4E2wcCngDhdf+lHs0FqkiV4VzfEBu5OTAa9XLUUzXkz1J+OXFw8X9G4FmVbIIsXcw9MzZRWBqWU5O5y4y/l2+VkpfjL+LeHcRU7INztTRGrfie5m81ysYI8Z4NzbVichdjCjF0F+YCHZtZx8HrChrAIYWoxNRZ3AWLqY/5UKgDI/qxgUJEFNfuw74N01NqPaAzdnBrivd4QVILOvXT4LfuZM/U++x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?79roPQECfNM7VD4SeW2hs5+LXnOyb5+mr3xdiRsr6aFeaYvHcjmqG9WsdXHP?=
 =?us-ascii?Q?dOLpxvg8X06byNbTjqu6eggmlyBvEs4ldSOqwgqr/sUxcN5QbHXL90DMxHxg?=
 =?us-ascii?Q?keBoP78cr8ltE134hM9uawBnVOI3PTdDbac7J5d3MCYD8IjFgsD5fXd9xdyJ?=
 =?us-ascii?Q?m5g7CjaFcZddflRjq/N5SgXexNJn4aQSZ1vntH2tb7Q3Ptx/2ayNhgxhIByv?=
 =?us-ascii?Q?fZ/NDDpw+GoFUpPlFs7MA68PWtEGF2NXRjKJZ4meiDqVcoLDws2L9bDr8NLj?=
 =?us-ascii?Q?AMHMaBtEdsNnpkVDyrzpcJ7RNa4HcDAO1PmPUooWmVaFDWAQy7wORcPbWBHN?=
 =?us-ascii?Q?KFUlVxToD5fbZFFFKTniY352oq6Lk/sYh3paHmfIQkfDFn0p2wuxTbjutUl2?=
 =?us-ascii?Q?HBTAE50SbStjRMbVRB3uUtEXmmra/8KfPt1jb8AsRZSUcJgieP/10rt5AZgp?=
 =?us-ascii?Q?IKK1MIvy16K4q3yYADV0laWHKkVF2xyglyZ/zQnbZ/g6G31hVMQjuEmQCPP9?=
 =?us-ascii?Q?LPR53AwMZlfIaTXWTbBX8XH3LP0fxc/Df2NPAFKDJpNWbz66SdFDjcWU3x8f?=
 =?us-ascii?Q?TMfJXsg441iXG/bmupymiH4zEyyUKAzev8WWUAnbF0Bg/17LkM4z9R7p6wuc?=
 =?us-ascii?Q?Fe7W9SGI5XhOVVh4YUXhIkiIhYZe8avEMh3lODB5yh1sb0OffhjuROl9RDPP?=
 =?us-ascii?Q?8A6T/c0eOclgurOQLN38GVddSiS6GfIzAd21SgPMxy0Q2j0M/Hvocs62J6Zz?=
 =?us-ascii?Q?AptbLDnzBIlHQBgmvtzH/Iz48ST1DOWknotW3D/cwZm/Dyqo9hvMK6YNdklF?=
 =?us-ascii?Q?7a5EfZ5KzP/Zff/tdQ3f8pUSkICe3C9e6MBZzXjysGcKXJOybCzGpVrutz9c?=
 =?us-ascii?Q?JVH4YkTyDxvF+D6hCd20fN+PqXwgDPWaNRLeNm1ry/E1dYauqwjajo9HeGCw?=
 =?us-ascii?Q?z2+b3zs4S/KnrBpwTfIXeaPG/q2tw5otpVzulYHdq2r0YaIJ9nSoGLM1reto?=
 =?us-ascii?Q?dfiR7/tg2ysTGzknpQh6LBzN2oCUkT4n17dLA7sup5afpD/YYBkUxn76ovaz?=
 =?us-ascii?Q?ZhYhBQY3SVhYHGjWs1yXFihutDV10mi54OfKt64pIq09NdKANyMMTM7Lk+AM?=
 =?us-ascii?Q?HbM5Q52F95TLJ5oTLc+2sSH2YFN8WE+Gz8qxVBlFEhf03c7b8wVZa4VKKceS?=
 =?us-ascii?Q?jOmp50NQFyjFsaIqjEpnFS4zjTrJ2VMdiS54xXirOjfDmFuv5cTZcgF5SSnl?=
 =?us-ascii?Q?vVHSEN1qdLZSTiT8Tc/OJ+6uaXAHlmkaNSeiC5PFaA8JFYF2I6ymMDyl8DzV?=
 =?us-ascii?Q?HIJpzpMEolgKs63vKINSxEJqU6hAYX69LovW6cPeQweCS5Tqnxrwgf7ZQn/g?=
 =?us-ascii?Q?/ENxg7guZMN9aemclb3RrHdxG5YMi2iuQ4w+ZVJYUFM4DbnZZ2eD+Qfx5QWF?=
 =?us-ascii?Q?U8YZuGBY42E7lJpJ81+CF69qkuSI04WTDw82zoykgFeJrd877mwce3Pb+ovf?=
 =?us-ascii?Q?luKPpNKkrydwMElIjozsuGbvDxqtKSBQPY9VEh5xp9wdkGQoX2ol12iOflTM?=
 =?us-ascii?Q?nX0tYBZkU73KzQIPeGXHn27EhnNkQWyWO21CGiB5HOx4PoCUQ1eaGVDAiRca?=
 =?us-ascii?Q?IngvoNd8hVGvHUOSJrezVLBac2AyP43l+oEZIqzRdBCs4Hd0o7J+GNCCIGbw?=
 =?us-ascii?Q?3C9O3WqTW1sukV24bngcjFdxvzNzpDKt28Bm7egLbqjPm0Qo7KLWWEyCYS5J?=
 =?us-ascii?Q?R8DoVxZwQBCWnQh9bzgaM+JH7GCFm5M1coVKs4S8e4TVfWfg0JUo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534dcd83-0a15-46df-d397-08df287d06c8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 16:22:36.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WGcuyjXR2XqLiY8DlQvCUyV716ntv/I79od+lz53EjxTrA+snhb+yAk2YyUeKqlHZ/K7XPEptwt9coppUAuMpKsO5VhexBGbW69240tTr7mq394jTva1RaaNmjELdvf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_092244_853803_410D8866 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 12, 2026 at 08:00:20AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>

Subject:
	s/dma/dmaengine


> In dma_async_tx_descriptor function,fix the situation where the operation
> processing of the little-endian variable requires corresponding conversion.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/
> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Fix the operation little-endian variable issue.
> ---
>  drivers/dma/amlogic-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 78ee2337ae71..bbf5ae5ac705 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
>
>  	/* the last sg set eoc flag */
>  	sg_link--;
> -	sg_link->ctl |= LINK_EOC;
> +	sg_link->ctl = cpu_to_le32(le32_to_cpu(sg_link->ctl) | LINK_EOC);

Does it works

	sg_link->ctl |= cpu_to_le32(LINK_EOC);

Frank
>
>  	return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
>  }
>
> ---
> base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
> change-id: 20261012-fix-a9-dma-4be7e61ba653
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
