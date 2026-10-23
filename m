Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB583606A31D
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M460UN5p;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=euie2p2f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eHzrcdiLIZOvO7pnLD8ZGi3X1f5WkZETArZWIt+JTqY=; b=M460UN5pNxScaFWRcrATMf3zqF
	wQ1CPQ/Khdt9ZCQjUspEgMTgO3gul6JBuEltPxeIed5/nLKDGxQ/1hy2Xg/hsPWmteRv5pbnsDNP6
	dtSi9Z/itsthEerGuBaPSwXnIc9JzOtZWRXFTvIg0bCe6TjKXK6P+w+SUheltAsh0d1a35bLx/aIy
	SwPKz4Bk8IvM3WUPFyKJt4qaWCGO8ISBoPQ5o1aksr5/5zIuhDhUxERrd1+8XXzn3UC7tgSMJAWjR
	eEZzRwLyrunmMqm57k4vH6PWriMwzCB+lfqNnKNksYKOMPqJhI6TeiXaylScnVzRTWZY0B+9Csg8s
	INqlIrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMAm-0000000GwnM-27t0;
	Fri, 23 Oct 2026 20:47:32 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMAj-0000000Gwmd-3Hie
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 20:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLTPxXn8QpijibFDKCnebsGZui+xvP3kv+IZ6truruHmVqhOAfTCGfth28Dp76e/O6rgpegDdxtTnAepiReUmdCuckse3fF605exqnvxPopRvI035tQQd8N4Ot633zd5NSFdhx5zAAmYNB4EWNeQ/rOrYfILlsmwMFtIKx3Cnc50bt2nGBL3mdpvu7ZuP7oNFrlkLZXu2Uyxb2ADXTJvhmV4olaD1jEjBQRKNMr+mX4g9EcThJEnRKEc2lqgXzrADdLhGnZzSO7zwvgXUBvifOc+bCRn0Tc/JRPUAcsfuyZwFdDLEPryMFeOOSXIcAfD2IBGZw4KedFIlVByb1Qa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E6StJb3QI5GrH/jkmYhwLq9knhaxzuBoqobOighR7s=;
 b=pHhJxmNqPhOalkv4UHVKFfLvUg84/H9gE0rJbzYWFpzyjLoVjswurOa7crNAJ5F1YGmnrnN1XkljTqwyyHeA7UUE7DhMChroq+NfLPLpsrG/VarbYVqRz7aO9xtZy4ePiTSlm/HI1sJuDAFhldHkRvdv4+kERZeyRSUYc3IckccHPziQDtHhdVJOhbhLr7Mg4401JjavZNHIdjUxQaKijLfFBx2EOBwcPp488VrbFOUsTpWqDannUmBMoHLdAsUHkmavPaivaQ5jQ72OHmqcr3nLKrN0yakOOhR4k/D/0QBBKAq7t08L/q5TehPZ/22D9hmciou9dC/oYIl7or4qAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E6StJb3QI5GrH/jkmYhwLq9knhaxzuBoqobOighR7s=;
 b=euie2p2fi+i3MUySm1r0wAT7JAmppj+Ha30/PDyh+iyLtWqAoBTkAYM3J1PYGNQTVaMlA5mqNDHmYolTMUBMqmu5PRDdbzTauepzVx8bCyYU/SOMOpMO+mCv8pfc/cRMTQLdQM+lXI2cS1anQmBHPI7o55WfTZmN/zroe7e4F2wbqFU4Ydnz5rZGL6QxHV2RPUd7ZtDatpI+maQTqHZBriRclRlw0HjQjTgD+MvraxPG3lROQYqGiAJB3AAyz6g+mIUMkjzo+7elH0s75GkuuKHTbHvILle53h88bG2gtLAyZyIqCXk5dLEJba28qDs+2lgqr4PZ4cP4tgzk2EstYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:47:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 20:47:25 +0000
Date: Fri, 23 Oct 2026 16:47:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: amlogic: Fix an error handling path in
 aml_dma_probe()
Message-ID: <atvH1ZOrSbsGwncP@lizhi-Precision-Tower-5810>
References: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
Content-Disposition: inline
In-Reply-To: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: PH7P220CA0138.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8301009c-9cd7-4a03-6a14-08df3146d7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|11063799006|56012099006|261022105027099003;
X-Microsoft-Antispam-Message-Info: aAknh90ufKKzYRbWapKSuJO8pphu8xhMtapHD0f/EKpxeKD7AImMqzdXaBTU1W0FbYoByXsLo7WFIKY4UxTDn+YrntjQsckgYlpKXAX1dWO5Z/thDaplfX9HYLdpDNfwAlCT7Njej9zRYmWIwB2Nt7YlyEgwnpjr8AxbX1ksk6Gx2iVxIMBpuoGOzcsMKofxfTmyby2cwk2s63IeJnw9Gwn43sOmSi8ANeNz5dfrkUhfq/7XVre7OPUIutt3YAAs3dFOc5z0zeERy+UD9nqu84q51WXtynEo0Gv7F0KO6czJ7KLKn8leSFx+ex80hoGca5WgfOvd6vaycWc9v+VOAkWkw2yhf+vIrFAWnFZuqHOJTVmjFGcQC/dyDYgqykOV5OSWfw+cTjnrrSYa95Pa1su6RuYa/S6W+XV/1Rw39i4NSIMNeAB0M+Q7e+b5GYgQ/hfPfrtBINZnH1ge1C52NPkTpc+OgSMzb4WHVbP3tRK0DF5AtzecK8KGp73NeRvUggtO4Jxodn13kRyXRTLlkC4Lm2n5dSs39nxrmw0jPpTfgp2VIYd5SpRqqe5LSvJX44/UKFEPofYxyxc99leNDALmbtbUo+eaVEaZHCrUAAhLtnMhw0gKtp1oYGAx6fFeCwOy7Z4pNX0g6HSaPrzVlTsZZHvXRrqnK65avjDStLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yOmSerBt52cZwDAxpT6x8LRjEK0IakXIDU/hHnLW6lyny4fREEJ+lwyoLxva?=
 =?us-ascii?Q?ENt0p7QON1qo9PVcyj8RaCnwgFexkPpekoMaveP5CnMUJrNbfrZ+n21KFIin?=
 =?us-ascii?Q?inmFTPLGPv4au9vmIU12dG0/pZ7A6kefBg894I4NKMe83EBuqkjHLbH1Hxal?=
 =?us-ascii?Q?4alOZ49iws+HpwA1wZr6NpiFE7WFkY5zU0YwpIo75iXMXOuEfe0OXuUHOG91?=
 =?us-ascii?Q?fIVGLuddTj7SYhLJSgUzaP/F8ydgng6c74JUfN9pNPXrApEB+DKrySCahFkj?=
 =?us-ascii?Q?xkBsEbPv/BhNlthHE+9hUytsz4H7RYX6EmQHD1e3uI2giicUa4ds7Y0v/fy0?=
 =?us-ascii?Q?5pD9sSE/82v9AxL8jmEnEaq0Werxdy7/Wq4PpbxAGiDG2mokSKYOpLUywxZH?=
 =?us-ascii?Q?INhtbBqTM+6Zs1BnSHMRz9nARSbJyRzNdYaJGvI8pNBQzhkrB2tglnDN628x?=
 =?us-ascii?Q?UtKrNnpX+bp2BuY2h+RZyMIXKssRY9ykcwIJMqY5iJ9MhDi567N1X4k981TW?=
 =?us-ascii?Q?tMhUSlNWuno4Qt2pAM2IEBz6ZfBvwf3OrttU4uIuRA3Knfd18UG32BRh6ym9?=
 =?us-ascii?Q?5//kE77dlrbGojUtmbWgBGpHEl32tgFyP1LzY1k+S1dFb+iRIPyeBOBfr7J+?=
 =?us-ascii?Q?ZM89XVFwRw0mYjVIFtB8/H8N9qbtgMEJxtPlv9/cs5ZHpV2bYQg0MmtzVzPu?=
 =?us-ascii?Q?vQSsMGRcco5AO7rkzH4ceZR2kWvdT4J12dfds1lMktnovKUjxRDTjPOa5fhv?=
 =?us-ascii?Q?sYPT6v4/5AJe/bIz04opoNbHSmUYieE3kfJo0VEVg3XF8rE/Qwx9cBcfNsxO?=
 =?us-ascii?Q?aE6UjBoyjU4Wsx4ynEvom1LPi+CtQrxUM9SXyyKIW93eHflS8QMhXk9Zdmt1?=
 =?us-ascii?Q?RAHYlzQppv7pD8egQtn+UMG25pILgElP23W5oV45x0UYSS7YMe4xgfG1V+ov?=
 =?us-ascii?Q?KN5uA3IjJCkk0GOomp+6UCjIds91F8hoikz96TNSUJdIOoBEmwE/wLaDeMcm?=
 =?us-ascii?Q?Dqf9L47nDeUMoJsH0kUKB4RjG065KlX/pL9W+HiTw8i9NYDCQGm+De6u0Ioh?=
 =?us-ascii?Q?AiqJj6tcEQ0F2JNVOWgqGa3SRydiXMquRs1LyyadflZKLpxzw2EcN/F1SetF?=
 =?us-ascii?Q?f3Ux84ZkDcQPFP1+7j6oOTsiWyf0AerZ71b9tY5zE6f9JfG6z5tYaDZ3dtHY?=
 =?us-ascii?Q?KOzYlAAjYkBrwsyKRo8GWiEZWQtQwQ4mC3VXVsXfXDl0NfgUluVRjVFWEDDh?=
 =?us-ascii?Q?LDuv8XlP9zz5483pT0iUgXVea6WbtrPblNLMr008ifFGXWDdRTYOjK7OQuMN?=
 =?us-ascii?Q?B/4ixVMCZMC4wuyZ+vBzScj3aGv6jo/2uCsCsgUpjMMUi9JxDEFS56BDHHEQ?=
 =?us-ascii?Q?6UeYHAEVG4xkBZaChNaqs2euNNHFa4UfsShnTmh469HbxW8Vy41wnWjLr8Ca?=
 =?us-ascii?Q?8IouPxS9/9CN28eNbys8JK8mB/1+00A0nZ56fVW3qz+s7mx1Zr0oxIktxuNd?=
 =?us-ascii?Q?iVGrXHoinTo/chzpDst14jQWKzoSEVJRfMKkluQLSUD9YidO714Oj0eNPlDd?=
 =?us-ascii?Q?dCoXUOt0hNOYvt29KfOhbhTQ7xOyzfy/eFL/B/E+JfwCp+FLEZFqqlgzpTYc?=
 =?us-ascii?Q?x/D1qh6AAt2phQqUPAieRpkZJNdILN/CO7ArNTR3g21y3tZNrleCdN22OVP+?=
 =?us-ascii?Q?tXNIS75Umiu/LlTbv0Zcaaz6G5BYFGLDPX9q2EIFB9jc2llExYNcSW34WkSQ?=
 =?us-ascii?Q?rqWOuX6vOJ8lhYVBi7qODEdKDDvPueSPAgRwwpmPCfFzew9/d25o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8301009c-9cd7-4a03-6a14-08df3146d7e5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:47:25.0269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9yrcxyO86ks1Lq9XhF0gvC3TsNVfaKc7BN8IGuTlXyl0JNraUGAugawMBHN8/j1qA3nInhFt0+GjmRM3ReSVEY0OUCzVumUoawHG4TOvpYN3XdBsBzEvFUNA3SkSGXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_134729_847828_49F5DC3E 
X-CRM114-Status: UNSURE (   4.19  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 09:52:50PM +0200, Christophe JAILLET wrote:

subject:

dmaengine: amlogic: fix missing destroy_workqueue() at error path in aml_dma_probe()

Frank

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
