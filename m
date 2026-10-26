Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40095606A321
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t7ULg1Ri;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OermcisV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IkzHQshTSH1c8uhvgH0NDEtMpzppTRMnhMSgmOvDJro=; b=t7ULg1RiKJ1WI4cfTDbhereTW2
	SdvZMSqUKh75iX3bfSLOwiMURGxP/umfDqxU5sRoAgRH8NGLLjVJNvV8M7RA2ZLPnpCHIc6IGKSgE
	l8INO59n0NLJ+u9+GrSbBnOugr6LqEA0dQhl9JnCE7N43ZacWyUqBXDWRU/aETCI95znerzLtU08L
	uFJmTrZdfg0QqaDtl6ckfiO7veRdmqxpfnm18GO2OMZZ5dOQLycW2Y3Kf9JZ0KPxlYVdQ6S45dsrA
	VODGi638WZtWFG6e9f2npQFeBF01T4zsJtTKPNjmti35WCZtx367fCEKONwfQ5z1PXeEnLH0bLxv6
	nQ3SPdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNxS-00000002vqG-0N8y;
	Mon, 26 Oct 2026 16:54:02 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNxP-00000002vpp-1Gte
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 16:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbq9jGF2DL2ImORPIngeIT7gSk39Re8g+bAoqZD1c5ibOgP1YxlRvZ9RW+6GFVE3PnD/925kMv1FVPchTRf15bfx8yTHLsHyNktzBYk5OlvT6G/wPbjsiybUfQqvk0LXM5Cz8j6qok4jVriSciaCEXD610571PTZb8e7d/bn+2+v8w8TS2Wda6CE1qQCO4/BEcC99DZ4WP4ZN086rSbg/orNKnrc8TK/+xcc3BrzHpXrcocJL6cbNMU3fnr9kI9giYhBnIy9twxK0rX3EwvLtInVGAA7gzmHs9K8qlEku7z/JA+igZ5LMDOFRiIeiqT7mqWoG1GYffZF7r1gqVYphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekUON47Apr9jxYQ+WLZB2ycXKC9CFYI5hF004CfWqlk=;
 b=I721VGM36k5oaAWdG58RyXnwOPFhZKAtU5/VhaUJjqE4SrJqvJYDQ3MzHe3Hs6886TRJVYTpTVH46/Qg5uz2gvHqJ3cy+W58PQDU1xkglcWgxTRDNscY65O7A8Po3wD+TpqtlRCcfAOa/nwlzf2WWMLpK7NQdMMgZt283U/Ivte5eOJM5tuQw3Fr3vO96dgDw8OO5orEP2/UCLVDMpGo5zsvon7wedvT3EgRYI9ENN3YxZ57xUxvjpE9dqFvbxh2TKPMACaIfH/TE4nI7/4D+NBlXRBWQKeGkgk98uBARA290loadBlc1sYgQh/GI5GbsiS0Un/7aAUyccd4feCQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekUON47Apr9jxYQ+WLZB2ycXKC9CFYI5hF004CfWqlk=;
 b=OermcisVbtycZIOmlE7JjqF6sqT9CDgrSle/FjZG35Z4fqhUazkEDk6vkMpmYFroUgmmeLgT4IX8WcML+dM71RgxXR0xR1cj11nfaJOHokCVQh243uI0yl7dk56QOzJIKIyoCOF4xREPOqr44qgffn+TigIs2pjLfW60dFPpC6AucGA4/kNpEKQwSfzdHgN2OXEfXEab/cvs0XI9ZLi84qphW8BUXtaLqu+BgQVpyTVxpnE5WZ3ZZCNfjFZSlweFOi4b6iM5XV/ztl8JoikqNw8xDjCRWXEd5WomSe5ZU91F00b958A0yp3f764qjOfZkwxuo4+ZpgreMoBr2L6rfg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10340.eurprd04.prod.outlook.com (2603:10a6:10:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:53:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:53:54 +0000
Date: Mon, 26 Oct 2026 11:53:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue()
 at error path in aml_dma_probe()
Message-ID: <at-FmthARu1uVlHQ@SMW015318>
References: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
Content-Disposition: inline
In-Reply-To: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6986124c-fea4-49a6-a141-08df3381b852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|261026140227099003|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261021123027099003|261022105027099003|261021121427099003|10067099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: s+v/7NSu2phB/zHaAMTvEO63lL9lEl7b5vXbJde4kYVrlYoTMuhUVEKZyRvmacp0UHkF90FHWx/lQNQo5JGvKQkOH5AJX2C8D88B7FeWuqvdHFZx7RpcyHglvJgDrEzJ4cLqdgfq7ccNMUGUnmT2c4tGQQw8pSNp384Hxdu7iRCidRInkuu7mO3OdRpxNPBzWAfDksrbZMtCO8uSUPnBihJpxvfCjkNu55Jeuvd9g5A7J/VNf0ToAntHa08PSE6yqQBXHBR9qnSwqWmjXBhzrDbgWt9QYTuzIgfsgMgNkwZjqzlvmsIzShAb5wRgtA+yBm0VTefuL5V/m1QYvWLnb1jhnwT5es6mVhA1EYLKQIxcF8gAUSSAydn9vBGizR5whi3v2N9V+0buXKjFxqBY1tO3dJlrfgiKmCAdmhQHkqMlvMeysHnrhraj+iGx87+CU8bPv043GIeyMCYu8XalEZ94/WPdxJhck84H7t/YgrmC69B+/YRLGdyEMZ3d1RQH1EORgfKGVUEWHqJkmxUMT7cJTdPCbymC/nPrx4sXoKvRQfcUjlDzaCGv8o4zYTyumESbmhNX0t2PYgSsDvPBq1nf76pr0d7SruVBjqs3fbH0mdGZLo95sD7Ee9k802ok
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(261026140227099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cp1vKrHWmvFmZ6oRBMpnkhdUSeuCpKoPBCooLu1Xh7EztnbSBdAvtT2L8NKU?=
 =?us-ascii?Q?F27CK2Aw5IchoPOkeOp1v4q/NGfcpYzzPBN1SRezOGrHPRT7qBmkjxf7Lsjk?=
 =?us-ascii?Q?EPum0VqY/lehk11/zBWsdADygX980dFesX6QclkS2cmfhKU1G+iMAHXNwsRc?=
 =?us-ascii?Q?aRAC+5l2vtvimXJmz8v8JICCkZHgdHR/L8d0ImkNkZbvIBNE/I6LqimWENxT?=
 =?us-ascii?Q?HQKlKmnct9E6a5VkP4mR70EU9A2WCRy4Ltw048HL/uAjwhH7VncpqqOcNnmm?=
 =?us-ascii?Q?KwOKVyTRs+u3yLCsPZYQ+oV0DVen5vdAIb0MLsIM+/noLwbqB/LlWxXdfkIA?=
 =?us-ascii?Q?WqA3GalZhOXZbtT9pCOYW3ehU+FtxMxriVWNOmDLk8UGp8MLyDTYzEfh1eaM?=
 =?us-ascii?Q?ni/P+NwtrSXXPTyExHiJj8FzrgeHiQfXJpBDbw0cEb57wGLgOtmoHk/bFpxY?=
 =?us-ascii?Q?gmH0w5ZAJ00tasY9DiT5hooi61Ir4HFF9uHe9afjaFlrP3ya9nWWgNvEy2TZ?=
 =?us-ascii?Q?75vcdbMUQgnQq0TCd5g3kFyT9N/L/rqRoTpcPB/0YjFbxwEi/NY20zyvJhLO?=
 =?us-ascii?Q?pDND75lvHT4LDBdH9fW9IBzWXoHhImRUxJ6gWnjk84EPxvE2IAPhV4iwHFiy?=
 =?us-ascii?Q?EdU2XjA1rVsoK5rePIubMDlIqqqk0x4GyVkjO5si8IkD2cPP+jptQ/kYTg5+?=
 =?us-ascii?Q?ZyOYAgAOxEOYsVHibjxPvD0BIC4HxAb9kOg3O0OmvDJ3l0gGfgd6XYza5wd6?=
 =?us-ascii?Q?jkWxGl6Yy9F4HWH7qIV2mFVuSbT/b+ecO2NmKIIBgJ8zSjmX+vqw3mqzGWlq?=
 =?us-ascii?Q?dNZN4UMOvi6m0vLDSaUTGlGfZCxigTp0RosdCUlL1p1OpVkwoaJLIpHO7GWc?=
 =?us-ascii?Q?wD/LqX1LMAcm2+/WSDGGB+Og2dCy99xqRa0RFioG4O/p2s4bC3XOhpArmiw6?=
 =?us-ascii?Q?iTn2cZfPSnLJ3Rsn55nJ4hv5Qy7ThtEZqVX+QQI0LnOU5UKiTUjBs3qsH7dt?=
 =?us-ascii?Q?MGF7X5l5B1sTNqcZnji8L7Py8LSPaOCdgKnkJgn9kM5NoheVb5T6khGx4av6?=
 =?us-ascii?Q?CUAsBcjdtRn9OEXtUCWGh9mQCYTx2HF2PlS3oYmVVz/KOrBwwwNvVeokJDA2?=
 =?us-ascii?Q?mho9U0dY81Pyd3ucGVzA/kfNYMRrU0V+/czqR7oyZanMDYhBjTe34oGu7lzi?=
 =?us-ascii?Q?VTu+sn2KuyQK9zKHtQhIhWYuakVvVH+fa/Vu6UMknwJuBFR+LnCe0tAwJPGk?=
 =?us-ascii?Q?ax3zB7KQ8QEe+8DXG9E6PxhEl1Zte2HXf8AbotV4JoAooMa4K3pssi0x6y1l?=
 =?us-ascii?Q?cREyULs91Sql+0DWoYAm4Dd5FTWNA/0QLwP9eb9hp9Iq1T2a9/ryUX/mvF90?=
 =?us-ascii?Q?TlFvs6PgHKseYqSsO5/wlovCySS8JXFyyWhygkplAjd/xhBkVvjxdVW02Jk4?=
 =?us-ascii?Q?X5wAD/RsHIEHDEUaqr8paml8AaQAlfmOSFdXNnGpIx1wOW6JSytHEsSpcptY?=
 =?us-ascii?Q?KncO6s5ojRgoDDNDrsvuqa9FQQm9fdfewn9r8KISNvrBYvw+cY4ercey8cH5?=
 =?us-ascii?Q?BOKalIeS7CaGtr6dfvo/MB1rnU8eGc2djQjAZU6epBkxCRCzOWQ2mmbDJhok?=
 =?us-ascii?Q?ufAs9A30u5wdg5uALB6wGj/xtFroeRNIk1WmPt8Hp2yMNQU/0OSs0Er2OG4X?=
 =?us-ascii?Q?hYJrPSc6zHy/JLO+aFvvrobPGWrUSExyEsB7YkkAXqaTgxGKFRHbSFTYS1H9?=
 =?us-ascii?Q?xhpOsmmx+M4ciBsskSiJV3lYBSdGT/gL0WvdY/Biew/xV47IFRyk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6986124c-fea4-49a6-a141-08df3381b852
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:53:54.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4ZorFKPcNwtaxy5pZOXQ2E6c0HMH1+Lx/dAcJXnnCLoAjTXdP4b+fu6gFVa2XabeMxdIhLlTMAnQIkS2+kF+h4YLD+D+vTPbspPiBnC2aTOap59gJ+FMHBLY27ZzG0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095359_351065_6D84B93F 
X-CRM114-Status: GOOD (  19.40  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 11:05:13AM +0200, Christophe JAILLET wrote:
> If an error occurs after the alloc_ordered_workqueue() call, the
> corresponding memory is never released.
>
> Use the managed version instead, as already done by most functions in the
> probe and simplify the remove function accordingly.
>
> This avoids the leak.
>
> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Compile tested only.
>
> Changes in v2:
>   - update the subject   [Franck Li]
>
> v1: https://lore.kernel.org/lkml/93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/dma/amlogic-dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 684121d13fca..791bd82743d3 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
>  	if (!aml_dma)
>  		return -ENOMEM;
>
> -	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
> +	aml_dma->free_wq = devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_free", 0);
>  	if (!aml_dma->free_wq)
>  		return -ENOMEM;
>
> @@ -712,7 +712,6 @@ static void aml_dma_remove(struct platform_device *pdev)
>  		if (aml_chan)
>  			tasklet_kill(&aml_chan->vchan.task);
>  	}
> -	destroy_workqueue(aml_dma->free_wq);
>  }
>
>  static const struct of_device_id aml_dma_ids[] = {
> --
> 2.56.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
