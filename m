Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726A0C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ec5DLH6REwgBjtXhL5R/EGbuzp3lsHe3OumYMxh39eo=; b=Da3JLbd3gmCVcv
	gRZ/iyoYK04epszoTKvTpTjIPOm1rf1sg0YJg7pjyzQ+nI1L0anIzUVTgYZJzN2awEeIhkpJllQe1
	zJ7mmprBs+RUQhrfmRGbVIwEtqic1hz6Ery5PlwEkYmg0sEp4TgjO7jPsNjzdxgb+sxF9i0D6gL4a
	dSbZk05fP0ZQnUt3iWnk6modI8sHB+4DvIKi2tbRujNmQdL4F6WArbxmsD3inUxjexIE0lN1xNVG7
	TowAq8O/XyaalbY1vHZscPxV0OqbeoUgX0SGRj1KHy6wCro6jAqKh16HfwA2fs5wddMF8QUzl6j3B
	R0gm87MqKh9BAwnw2+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QNt-00FAvM-GH; Thu, 08 Dec 2022 23:32:57 +0000
Received: from mail-tycjpn01olkn2034.outbound.protection.outlook.com ([40.92.99.34] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QNq-00FAo2-Ja
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 23:32:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USbt8JAFq4WaubcwlGCUlHByTY7tqWvatvRNTrA8A9OCCVHFdmlfUTQkFmXpR1xtg/qsZeLqSukpz2Rhvmoadszk64iecgXBeZYJS9TZLRGAHN+rj2xt6niRCbxKK/MdSetUb1RV7LI47s71BJAzkKDhYqn6UbipXiNA7ei636S16XOF4T9o9CpjCSTdtTzvPu5rsWWKKQwj0/CygAdhK/k2UyHGfCLnU1UmEzyBAcfwaRNDIKnCXV5FXCM/qbS7KeQGkXYIYuXOW690LdV7qzv62eFgcdWy0ZOwGI/GWiyB2nHRIgyV+rwdBo92QBxdi3a9X0sTuWr2fxFawEKzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ7PvL8kgrtUgGcuFOI0OMvDT1sJ/zfYNLRpIdi5cV4=;
 b=SbPdi44G32ny3DZdDA7Ffh5t/1edezjfMHvrW4m+5T62QnvyGgMKWLTfkAXMpC7CwYf+5VTo9lfMhNWloDFALj07EQ+thFy5w5g3+kBzb4/rHPUVDs3klugsV2iaYYfpUCv8JDpqi0J8+no0braGrUnH3i4jo1oiaaAqjJfozCy872nkcS7rVIywLU8lycBY6WUaHgyDOQC0XrZd4AR6mCN0UKAnP/mcUDjJlaYtGufxyCW0CyfPXmsbB7xvVzRX0xpcso7OMpkVwAxpeUu2xpA/dzLIfWB+xmEDbuuIhgOVHLta33ntmV0K3Hgri3/vp1apaaqlKnOXUnpw8ZEYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ7PvL8kgrtUgGcuFOI0OMvDT1sJ/zfYNLRpIdi5cV4=;
 b=syQr166m+nFK81ifBmD+e4O/BAnSkE4mJ087LK1mr91frO+x4M5vAERRj8xd7OOBKfysWJJmphESh247WdakDmYOjkJs+LBBm81y4Dgy9y34x3LWqCQHlUTmUB5ATIml7e7u0CoPvoTC/RzNphqDOO9v/5FMQJIkhoAtSP+cMIhcNVGl9D8M0G4O/Y1hXVhiMgimRkOnMJWMfjEMrU+s7ov3VddJ1JRY44pqCwWLylCmwm2usRueMKTYbgQ2pMsv+HJV1jf6W6AJAGD8uod5wf/T/4j5LD/eisE1Xz+eQk21vmLGUTeipqDC3FMOWKPaMZZwyC3f4e4wB+ebDQJ3HQ==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OS3P286MB3322.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Thu, 8 Dec
 2022 23:32:49 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5880.016; Thu, 8 Dec 2022
 23:32:49 +0000
Date: Fri, 9 Dec 2022 07:32:43 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB0641B4E3342EAE3902004502CD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <CAFBinCAa3C4KcOm8jLwcNGc_btUXUXUDGD+6yqVivxc+DDA5TQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAFBinCAa3C4KcOm8jLwcNGc_btUXUXUDGD+6yqVivxc+DDA5TQ@mail.gmail.com>
X-TMN: [QDMAOXO/bImZo1sdEg+SWcywEjcINHc7iJEMkr+KBjqjGp0cUrVzHfolG2azYJIK]
X-ClientProxiedBy: SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16)
 To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y5J0G4MXhF2wg0Ch@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|OS3P286MB3322:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bec80e-98a3-4efe-a7ea-08dad9748473
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6SH9nzR2eS8n5Yw8OP8JWmtXAcCfaqfpOJK3GrkxLdPhwymtzwFCvxy5vNLLeq1wCu2K61Pm7riWDNxpIpiVIc2NdlOaVPOkOIGWTqAFjeJrIXRTV7A1a0ga5vjKD8Lef8YBA7572jlWCw8P40epFtUn5RElzLFjA3vW50Fth7PNGTCyHg1wwBpMZQR9j+QSZXKQPOR7LHyaticm4Wv67oIg6QJoDVDiTv36jIk8k2Js46sza5KRLdBqmyO62HdiMyL4WzGOnHoDqPplUibYrbAeGT/XhkVDvhOd1NUoznCE0yi9BjJlVcpm22/R2DnkuVJe2JxxhsgQkN1md2a3ES+chk7aWujZ8igoxK3d9HegbgUQLO6INBTsQAbWOc0oYzw81HBgRW1fMrszW4ViG+LjBYwZ6leovLw5S2fdy6jDq/QzF+cIWF+aizQn7sYyVAgJYmbE2deoXXMQPXSreXliFjLkUhYWhoUBTIZRrCEkunaFj9g+oxSh9pvAVuXjlAXSJDr2oBc8bZkUvO+HVGgppZpsobyRdjdZ6uKKYO7VaBUePKHev0T1mfXhZ/kQclLD0jVN+xNm83bDN0lNT73GwE5C8VeAFEb3SdeOa33xsubPTEorvCxhDODGv1/sdMqoBqxeH004XUWecjr/vg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MzUrcWsxbHhJZ1ltUk05K0JCYldpS2JDWDJDSGF5RGFRNTBBVmFVdm03KzZr?=
 =?utf-8?B?NjFISnFxYUcyMkpKVnFtc2xPTXhMMnA4YnlBRStNK1RFTlVmczhtcWFycEFO?=
 =?utf-8?B?ZlpUQWQ2S3JubS9ldWNMZm9NdXdMSHZ2dTR6WTA3RW1jaHZKbDZuc21LamU1?=
 =?utf-8?B?YjVLQ3dodlZ4OU9Bdy9jMitmcVpqN0lxb0lrL05NZnZYTHRhTmFneUlHUDJU?=
 =?utf-8?B?L2drWGh1UkxPRnprTElxZ0JmYURIbnFFdVNmVzJyOGwwQmxWM2RDRi9NdTgy?=
 =?utf-8?B?V0V0MHpta1pEM1FnaDJiRC9kbE9SQ2t1M0FTeG5JMTZuTWVOVGxlTGNoY1ho?=
 =?utf-8?B?aUtLbFYrYTlUUGF5WHc4SFpqQ1dVQ0RGYmd2WjVNb2NuNmpTV0oyQjl1aDIv?=
 =?utf-8?B?aHpGZy9JQnh1QnZFajZORWpBZHplR0hBYmdaUHFnblZhUHlzT29rN01xcnI4?=
 =?utf-8?B?WUJFUWk5MFlUVDNRWmNiWUJqRWlNb1FHMmVZeVM4VXFyblBPV01WU1JDZTA4?=
 =?utf-8?B?ZnBjanhvamJZUkNHVmZ6QzNtOHFyV0g1b1ZYQmZsOG1jT3VqRWh3WDJ1cWFl?=
 =?utf-8?B?R1NDdTIwSUNweFl0alc3d253NWR1ZWhzUkxuYXRvalZVdXlXVW5xWDh4bTd0?=
 =?utf-8?B?M1ByaDR4TEZBZEkyeWhSSFNzS0s1d1NWREJiZVQ0WkVjaHlXalladVVvMTN1?=
 =?utf-8?B?OTJjWnFNRXk5SmZadm4vWUliR1krMmJUOU9hUCtHZ2M3MTFUb1l6aW1HS3VY?=
 =?utf-8?B?WkFYMTl2ZWJXT3Zwd0JUNk5obU9sWC8wbXh3dzlrbnFKR3BCZy9GaE5IZGo5?=
 =?utf-8?B?MFBGeG4yK1RrcTEzTVFwdTRZRU9BakpsamxRakhhUzljM29wMThnRzZKRy9H?=
 =?utf-8?B?SDM4QUtzU3hkV1hFcmtHNDJjOEdjUHpQWXIvN2R3bnB6REpZWXNZN2FvVVMx?=
 =?utf-8?B?WXBTMTVQb3cwKzhHQWdVWUE3amM1SklYcDVWTzE5cWRFakgxblpMUFZtT3hU?=
 =?utf-8?B?dkVmY1VqNk1JM2N0dTlkSStZNWxidVFoUG04SkhzamQvSGx6c21kelNNNjJC?=
 =?utf-8?B?Y1MyMGI5MXZKMkhUK2NHVkc5Wk8yZWRvdFdhZXZvMVM3a1FFejYzMzVxa0Ns?=
 =?utf-8?B?bi9pTlBFMXBoRmp4b3pMWmp3eWU5RmdRL251OWJ3WnlMK3NrcWFHSktPdTlM?=
 =?utf-8?B?d2UrUTFWSktYelRJamVIYjYrWHdxRnI2bS9PY21FTGJMaXdoM1dNWmlOMk5M?=
 =?utf-8?B?YTc2Rnd5S2FsaCtlOFhlcXlMYWxHeE5YakhiRzAzdm9adWN2Y2loTjBEUjRE?=
 =?utf-8?B?SnkrQml3QjIzODljSFdvVEh1dGVPUENuTjN5aW5rSXpKcGxJVmhwajA4OU5w?=
 =?utf-8?B?djMrWFhjSy8vWlJSd1lHM2lOU2JYMHBhTzM5Q2lpdlNDdFBrUVhETkpPMG53?=
 =?utf-8?B?aWJnS2pMeWtsNjJSSDcrY1Y0ZXhveXRvVWxGVE50M2RMR1lKTVZyTzNjOVJY?=
 =?utf-8?B?Nzhxakl3K2ZsNkVuR3lESXk0bW1QVWVHSlU4ODI3NjM1Z1BRK3dENXFoTkta?=
 =?utf-8?B?ZFI5VWFEUGxnRFJzYzRPWEJqVzRPWG1nZ2srb2RQZ0xDUkF2eEltSkpGM05E?=
 =?utf-8?B?bGRtcXduVkp6ZXplU3FhdUk2czdlNS9sT3ZPdXV1L29KMlR2SkRydWFDUDVm?=
 =?utf-8?B?clltM3RGRitHWTgrQnBteFdsN1BBQXJURUpBQzg4YVE5emxNZGdJeE5FTDA4?=
 =?utf-8?B?RXB5cXlCLytFZHpVczZ6V0JvY0dkT3l2M1BmdE1idWk0TXB2dlpRQUtIMi9s?=
 =?utf-8?B?WlZZdHZIdFFiTXNvN0lGQT09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bec80e-98a3-4efe-a7ea-08dad9748473
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 23:32:48.9827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_153254_679123_9DFA270A 
X-CRM114-Status: GOOD (  11.60  )
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

On Thu, Dec 08, 2022 at 10:40:26PM +0100, Martin Blumenstingl wrote:
> Hello Ning,
> 
> On Thu, Dec 8, 2022 at 2:02 PM Zhang Ning <zhangn1985@outlook.com> wrote:
> > After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
> > below log:
> [...]
> That's unfortunate. Have you tried reverting commit 066ecde6d826b4
> "mmc: meson-gx: add SDIO interrupt support"? I'm not saying that

yes, I will try revert this patch.

> reverting that patch is the correct way to fix this issue. It's one of
> the few recent driver changes though, so at least it's a starting
> point.
> 
> > I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
> > to VIM1's kernel 6.1.0-rc7, is it related?
> Have you tried without that patch as well?
> 
just tried without this patch, still timeout.
> 
> Best regards,
> Martin

thank you.
Ning.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
