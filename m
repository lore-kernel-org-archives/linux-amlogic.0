Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A672C04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 06:05:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA1C2082F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 06:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cwul6b8d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZIxbebdy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA1C2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=O6Rzn9Yqzs8zXleZFxOZnJ+ZiC2U0yjqDlpVY/CoWU4=; b=cwul6b8dI83ze/
	jSFDJCoCXkZcrznmpGrcEvesGDpSd8s5WQaEvZdDoFSFBI0KwSW3NXCG830fHhAssgTbWRnAY5yzJ
	51kP6LJCSdSOVnRnzTaKYS+OwDsv0n3riM0WOh+GRKftnGHMGOBrxjxwvjEGs8zAqPAYTWCW5HUcg
	7fo2iLIHz1iQKcb4I3oZWXLae8shfK+dX9PfY/ioAuEnQSz0zTlCypk/Z0HVVIL6MbWwUSTS0lvw0
	KhjvzCK91cb83qkOBAlJpAcz/UaRuBHa4g6oZfAHoH1xXVtaARQ32hK48EZYEZvPmyft1S3fefEz0
	Pj7sXLRIYtkHtAnHFyMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWEgQ-0003qY-1K; Mon, 10 Dec 2018 06:04:46 +0000
Received: from smtprelay4.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWEgN-0003pL-IK
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 06:04:44 +0000
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id A69D724E1190;
 Sun,  9 Dec 2018 22:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1544421870; bh=bHg4C6rLRi7UwLFIFdr5ggrF/iNEN7K6aK8xjr0TKdE=;
 h=From:To:CC:Subject:Date:References:From;
 b=ZIxbebdyzbIvpog9Py06ulgtI8UZPLlYyua3DknB+YfdcOWyiUjModVZwJd+OXP4A
 b37iyNowU/EoSa9RCyI+1eRcjzkECWq05gAwrPm7DKLUHK6BP1J3PSMJNmrR6vV4B7
 pNGACAw4hhW6ecNi4j3xy2YqT3zoUOaRWcVp9fM0faz27BmG1BLCedZxtv++R21FfI
 ZX8jZIlr/vL+L2pca6HLIX3Tr4Ze1UZIRBr/7bgoenNMJbbNqtY9BUNt4LVGgCMBgV
 ynqeTAKz3FwerrIvvq17C/fTr01fj52H0qmshgOOhesRctGc+9P7GSIYGhPnZGefKv
 7oHl7ADN60nOQ==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5175A53F1;
 Sun,  9 Dec 2018 22:04:30 -0800 (PST)
Received: from AM04WEHTCA.internal.synopsys.com (10.116.16.190) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 9 Dec 2018 22:04:30 -0800
Received: from AM04WEMBXA.internal.synopsys.com ([fe80::79c3:55f2:1f20:5bf4])
 by am04wehtca.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 10 Dec 2018 10:04:27 +0400
From: Minas Harutyunyan <minas.harutyunyan@synopsys.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "minas.harutyunyan@synopsys.com" <minas.harutyunyan@synopsys.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] usb: dwc2: disable power_down on Amlogic devices
Thread-Topic: [PATCH 1/1] usb: dwc2: disable power_down on Amlogic devices
Thread-Index: AQHUj/GlZFUzpz34P0WIm4puEQupSw==
Date: Mon, 10 Dec 2018 06:04:26 +0000
Message-ID: <410670D7E743164D87FA6160E7907A56013A7B631D@am04wembxa.internal.synopsys.com>
References: <20181209190129.11870-1-martin.blumenstingl@googlemail.com>
 <20181209190129.11870-2-martin.blumenstingl@googlemail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.116.70.132]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_220443_609715_06E81DE3 
X-CRM114-Status: GOOD (  12.76  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "christianshewitt@gmail.com" <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Arthur.Petrosyan@synopsys.com" <Arthur.Petrosyan@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/9/2018 11:01 PM, Martin Blumenstingl wrote:
> Disable power_down by setting the parameter to
> DWC2_POWER_DOWN_PARAM_NONE. This fixes a problem on various Amlogic
> Meson SoCs where USB devices are only recognized when plugged in before
> booting Linux. A hot-plugged USB device was not detected even though the
> device got power (my USB thumb drive for example has an LED which lit
> up).
> 
> A similar fix was implemented for Rockchip SoCs in commit c216765d3a1def
> ("usb: dwc2: disable power_down on rockchip devices"). That commit
> suggests that a change in the dwc2 driver is the cause because the
> default value for the "hibernate" parameter (which then got renamed to
> "power_down" to support other modes) was changed in the v4.17 merge
> window with:
> commit 6d23ee9caa6790 ("Merge tag 'usb-for-v4.17' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-testing").
> 
> Cc: <stable@vger.kernel.org> # 4.19
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>
> ---
>   drivers/usb/dwc2/params.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 7c1b6938f212..38c813b1d203 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -111,6 +111,7 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
>   	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
>   	p->ahbcfg = GAHBCFG_HBSTLEN_INCR8 <<
>   		GAHBCFG_HBSTLEN_SHIFT;
> +	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>   }
>   
>   static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
