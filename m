Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B148C4332F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Dec 2022 01:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1VQO0EKjLNftKDLEULheExnqZzH8ok4pRQfyEaU9X8=; b=31SdiB5O00yj8y
	04o0Ed3ER0Lo9SNS5rBWxwHCX123Kxp1dE1K9jQ6RzgdEn29+OoX0sTKW2PYijXWzHjxXqn/y53fM
	jG1X9J0pVRMeBGj5JYlRCfRkByEs89J320shT/DLNglLXhxlyCfB8xRX92SXmX8lB6boAKFVw25h8
	BoKGrSB89IEjhv2PPju3y0l8xAeeD1OwCpnuuRVUudJhzLekqlWglbhGV29bYBkGmxcEItGt4SvVL
	AR5Myuyw8agkLYBk1khNfDho2ukg3gywtIDByWqecp6ke7Xfe7FdJUSpBF4tWRC9aGULKS9byoTB+
	POaqzTKRuchkOloKAVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9FdB-004zcE-9U; Sun, 25 Dec 2022 01:16:49 +0000
Received: from mail-os0jpn01olkn2076.outbound.protection.outlook.com ([40.92.98.76] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9Fbb-004yml-1W
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 01:15:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6YslDPnEYLZSLTqgA+TKhPRqFB+sSNXOBXU5PzhrpU92tbFCLv7IKac+aMXzCxXgzugheCORdI05h6FtbC5Iuhyt4vWrcmoJFSKtOUoN9oKFlxhGZIncm0mIVcUwukmUIlj1XhP9dg3EsUNqYRGFPqpUjxuUDy1Fb5+f18jnvcIXcnbfcBCLeHC9zLV8TGShRud4rgAdURayr5d/4YZ0kw6jJVxq1fneLb8QJ8d2nqbGRhlhad/MM3ODvbyBLVnX+bZ0K/RlhXpcm2Qab/1xUFazCAWKHOgkJwXvoF6biO3Dw49Jhf+LYMBboFi1eVrmNCNZdHXNZ+mUNuzhiRBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5xKASAhiMkVdAQxIk7RgKrMG86IZK3gwJnAoulaQq8=;
 b=OdY6uk3h+w14VD5nMK2ay0ExwysIxeV8136I/tDnjAFKVYvftH4Ins3sA+oE1jc8vb3Q1N+dQ64gP5JQnBFDBxl/6IXBoLPPA8YHiA6F+UcgnHgR/mvz4jqbhxdJmdBzObg8YmyAIwLDiLNgolTV3p+LIkYhhi2gaW6ec2eK6ww/PUw/OGRRB0RdLnbVG3IpSPuIp/ZKx+X3nq0Cb2yTokRWZUbpDkq9VaPMPg6G39/xF+jNdSlUGwlYcCBPzsg9MfZESBIjnSUYL9WkF+CqH0smZC00PRqISTF9sEiAgKuTumgLMw8jxYsbbrejo21L5SyaL8GwGWe7Fybhg9k9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5xKASAhiMkVdAQxIk7RgKrMG86IZK3gwJnAoulaQq8=;
 b=L3gkxAFAbUMMGrHp8ZXb1J717pUxlXyTWWT54rCYaoQphFIgBBKVKcME1Mo7EqA6OA4Khxrcno8zIF/QqHitTaf1u8JDbebOG2eLonQM8QO3RfngGZU7WU1RNs1Yv3jQcjLDwmFM3dy0DJnb88spcImeJzShq626oe7qx5RQDB8qs0Iq+zgYd7+sVFMIJ7MzFo5Ogu32iwUk7XIrSpvxwKw2dDr9HSyaJHQQdRD751gAPz4PMPRPJsHRvo6upaus8+COHeBdE++lm9+ljOWyUfZTifp+k6g4fmaHHh3J153/Bb3P3kzsmrIfhxk9oCm4UfU+nNqDp1IJqNeqNLgHHQ==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TYCP286MB2333.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.15; Sun, 25 Dec
 2022 01:15:02 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5944.016; Sun, 25 Dec 2022
 01:15:02 +0000
Date: Sun, 25 Dec 2022 09:14:56 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: linux-amlogic@lists.infradead.org
Subject: Update: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB06414BA3239D9BE69DA18E0CCDEF9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [ZpfYIegMnMc/dFR6gq9Ieb29DUu+LcnbjBh/24fOJ7ccSFc5O4bn7ZeXvwy+4IbW]
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y6ekEEEnanpNiXJb@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|TYCP286MB2333:EE_
X-MS-Office365-Filtering-Correlation-Id: af342a69-34bc-443d-d925-08dae61572cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aEGAc/0WsfryyzYETDZe5PW56x6yXdzk96yWOcCsVo25PW/W2XFuqgJ6E4fKjkeGL7PQPXRr8PBmbemeBbUWS5JswaiNzQTZCcvE3T5+t2uwaCfYvok709CUxRkjj1rqngtvfP2iEUdGBAI+XGLO8MgKtxIsecDoeWXfnOFCHg4VGPr0LH51GPYdt8Nheir1U4WcZeBcadFWIDm4taZk1zRSbJKWlRrraUWKJNt+nMChh2lANn/ZPd3RBqArRud5q8O8fCa9rvRfZ4ge855CbI72xw+nBinQERSDmP4RXRtB9as/nz0SDS57XtXbtQkCNiwG1OWjlCJAQAWUsv4K/AkrtYtDJYkm0HzIGMJsg1MrFI42sYd/A9aFdc5VR8R6ZZmRZ1Djijb8Sa7naZXP6yQD8NcmIIyO9uufz05rdQO0wjLIouxpDT1OVJNDloGfe3KIevEEwMFYCWJV1wFJs7FlYOAjH5Wn6MEnt20E/zMQ4Ye/MCtyJS/bbazRJn9azT5cZQdn4MgWTOAloRF7+qBW1FCSU3iKQ65s18xSIJHApXc3UXhYSnPQw24LquekoFLWSNNq3Kw80uBZvBoYXg/47d3znAc7R+fAhIyDUMM15hcnBTG9aqmt2SBornyH
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cktEVDZ6SHQvZmFBY29XZFpwMjRXSGJ1bG12cjZTZmNjNVN6ejFBbDR0MHQx?=
 =?utf-8?B?endEeFZKS1JMdDVTOHFkLzM1cFczV2RlOGJzUFhsVVdMZzZnVGs3cHpsd2R4?=
 =?utf-8?B?Rm5PUTVUUEFXUm9LYkVodEh4amhKU3ZtS1BsYkpEWUROd0ZFZDhnd2xMUFBm?=
 =?utf-8?B?QU82dmlRK0QvLy8wT2Z2eXlKWnhpS0I0MDdWV3huNldOemRCTWJXL1NJbUc3?=
 =?utf-8?B?WnZnclZDMFZMVTVZU3VtcXNsb2RwRXpHcVpXekdxZVZ0cDNLelBIR25WekF5?=
 =?utf-8?B?U2x4Nk5VY0JHWnpFV0NGbzRsOGtoV1lXYXNRQVlXQXltaGE3UTNDaWtsS1R0?=
 =?utf-8?B?RXJ0dUUvbGtheEJMdVZ6VXJKYVIrSkoyWkNCcmxXNG9JV0JRUmtkTHpISzRN?=
 =?utf-8?B?UXpRaXp0VWZvZGdYZnd0NEZtSDBGSUdOK3I2WExyZFNFSXU1UElWNElRc3FZ?=
 =?utf-8?B?QTdpS3dzTFcvQTNpTHBPbUpQYXAxVllrUzlWLzJnQTFnRC8yWlFLYWZpMzhY?=
 =?utf-8?B?WWozR3JmNzJ2T3JWMnUzeWxyRFYzY0R5aVBSTEJ3c3RPdmVOVmZBM2JvWmpT?=
 =?utf-8?B?blF1WU1yVjI3R0MzaHlrYmFjRUZTWGtzZktLeUVYSmptOVdxdG9SSUp2b0U3?=
 =?utf-8?B?cmhuTmoydVIvaHJqT0tsbVowQUFaVGxXZGtxU2IxYVVIUUZvQWR5dkZWNmdm?=
 =?utf-8?B?RUh3T3plaStKdzViRlRYSzVoeXFlc2hEZS82Z0hvUGhpRTJ3YWFoUU9JdzNV?=
 =?utf-8?B?Q0lackxGWFlOdXphSEVsY1c2WXZaRTRCVVh0Mnh1b3NwMlh2dkFCczlXa0Zv?=
 =?utf-8?B?RHZtZnpWdWc1eUppdzI2UE9SRHI4WnljcnlpVm5HN3AxL1FBeFZHZ01DRkd5?=
 =?utf-8?B?ZlhWOGMyNTdReTZ6MnJyand2YlgxRXgvanRacHFSVVBodHdNam1TbXRZZUl1?=
 =?utf-8?B?d2V6S1FOZHh6bm5nUDhkZTZZWWdNS1pNQ0pYZHBQZ0dCNXBIVlZGa1VJWSs3?=
 =?utf-8?B?VzFVQXhWYkFNRE1rYVlXWXd0TlBTN1hUZHF3a29kRGcrSG5iMjNWM1BkbzJn?=
 =?utf-8?B?cTVjcUJsZWQ2NjFsb0RleCs4c1lVK01KTlpKYmpyQmZpMVk0VWtEZW1CWWFU?=
 =?utf-8?B?M0hNZzRwS2hiNE1FTnFnWXBhMDRXMjZBU1M5WGpycnBDUysxTy9VYXI5bXB4?=
 =?utf-8?B?TVVDSk5wUHYxR2ljcXVhYnpkbUtTRzZrMlpocHREcmhRYnJzckZsVWRtQy9G?=
 =?utf-8?B?ZDdyS2NWSERzdGRJUi9IOEUwS2dwU1VRUGtHNzFXOGlMNWVBNnkxMzNDajI2?=
 =?utf-8?B?d3BTY3d2T25BNzVGbnpTZzIwdkNXYXVPQkZvK2Z5a0RVUWpKcUFFQW54d045?=
 =?utf-8?B?S2hkdlBRME5SV1dtUEpMR3dQbmYvOEZFcHlneFRNL2xyR254eDdFaDhSQXJZ?=
 =?utf-8?B?b0dZMjREcFVDVlVqYUZLTGhNczNndk9ETUgxOTdjWmF2V0VVY0tFVUFWM25G?=
 =?utf-8?B?dll3WkZoVWhzdzd1YVd0ZWxyVE4xRFdiclhQRGpiN01UaFEyRWRZQmFXcVFQ?=
 =?utf-8?B?MytGNkJIcW1sNTQrSWxxTHhpWHBRRjRiemsyQlJyQlJxcWptUk85VEhFbUt5?=
 =?utf-8?B?cnVTd3RiYWxxbXBlK1ZIamtuQ0w0Mjh5T2JkeXo5QS9kNU5mNnRHZFkwL3F1?=
 =?utf-8?B?V1hzQnN2VzBPayt5TFpDcStnMUloczF3SGhoN1hUVStNeklaSjBoZDJmTGNZ?=
 =?utf-8?B?MU83N3A2aTNqK3ordXdxWUg3U2JVbG5JVmdFQ0dJeW1WU2lyZnN3RlNvY2FY?=
 =?utf-8?B?REhaWkVhRS9RczlFUWRpdz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af342a69-34bc-443d-d925-08dae61572cc
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2022 01:15:02.4825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_171511_179351_42DAF11E 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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
Cc: martin.blumenstingl@googlemail.com, nick@khadas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi, All

In previous emails, I heard WIFI works fine.

I asked Nick for their tree for linux-6.1.
(due to their tree have some package patches, which make fail to build
deb, I picked other patches)
here is my tree: https://github.com/zhangn1985/linux-stable.git

I build it in an arm64 chroot env (faster than real arm64 board), with below commands:
```
make kvims_defconfig
make bindeb-pkg -j`nproc`
```

install to my VIM1, connect it to WIFI router and run:
```
while true; do curl www.baidu.com; done
```

it stucks after 3mins, same logs shown in previous email.

here is my brcm firmware md5:
501ca4e8307ad8e71c32f0d24369bada  brcmfmac43455-sdio.bin
d3ad92472ef030c3897062ff809a9083  brcmfmac43455-sdio.txt

BR.
Ning.



On Thu, Dec 08, 2022 at 09:02:00PM +0800, Zhang Ning wrote:
> Hi,
> 
> After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
> below log:
> 
> [  363.591315] INFO: task kworker/0:2:157 blocked for more than 120 seconds.
> [  363.598130]       Tainted: G         C         6.1.0-0-arm64 #1 Debian 6.1~rc7-2~exp1
> [  363.605870] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  363.613682] task:kworker/0:2     state:D stack:0     pid:157   ppid:2      flags:0x00000008
> [  363.621938] Workqueue: events sdio_irq_work
> [  363.625989] Call trace:
> [  363.628294]  __switch_to+0xe4/0x160
> [  363.631812]  __schedule+0x340/0x970
> [  363.635300]  schedule+0x58/0xf0
> [  363.638351]  __mmc_claim_host+0x104/0x290
> [  363.642371]  sdio_irq_work+0x2c/0x90
> [  363.645861]  process_one_work+0x1f4/0x460
> [  363.649879]  worker_thread+0x188/0x4d0
> [  363.653547]  kthread+0xe0/0xe4
> [  363.656523]  ret_from_fork+0x10/0x20
> [  363.661253] INFO: task ksdioirqd/mmc2:408 blocked for more than 121 seconds.
> [  363.668216]       Tainted: G         C         6.1.0-0-arm64 #1 Debian 6.1~rc7-2~exp1
> [  363.674977] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  363.682750] task:ksdioirqd/mmc2  state:D stack:0     pid:408   ppid:2      flags:0x00000008
> [  363.690961] Call trace:
> [  363.693272]  __switch_to+0xe4/0x160
> [  363.696715]  __schedule+0x340/0x970
> [  363.700154]  schedule+0x58/0xf0
> [  363.703285]  __mmc_claim_host+0x104/0x290
> [  363.707243]  sdio_irq_thread+0x84/0x204
> [  363.711000]  kthread+0xe0/0xe4
> [  363.714056]  ret_from_fork+0x10/0x20
> 
> I searched linux-wireless and linux-amlogic maillist no similar issue
> reported.
> 
> I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
> to VIM1's kernel 6.1.0-rc7, is it related?
> 
> thanks.
> Ning.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
