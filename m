Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E814C5CFFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 13:21:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CAC720821
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 13:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AeeS+21k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq9YAwoc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CAC720821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=89M71rUFIztSwb5tL6qV75t055vJbdffy4r/Yixbpoc=; b=AeeS+21kU2aZXb5dhf19RpI+L
	Lye6ZMUp9rsAg3p32AKsrOltkcm9hHddJBdXkNjldglUkQWA+LqYopx/vLXcQc3fjOdS9ga8nFw6r
	PYFQE+zylCV6k7wo7w7lOBE1tH/BJw3Ci1i6IWxI8hvCTKsd2k/yVGVOgdBwDDDA+vqIcrYvlVMu2
	TCL1P8lHg7aeHpGy2TFOwDKEZN2g3oQdut4/zSCtoP9X/MJaPI2VoS7thVmZmCGc/aGyWKYx1J+SF
	HfurE3UJbnvbPBJGjkpNuqUPj6Nt2cweNAjWTcyqZ0FoCPlrm85b62Xdb+W3G1nIdgZ2omck7dl2r
	CgF8vgCDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWLUb-00058W-Mg; Mon, 10 Dec 2018 13:21:01 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWLUZ-00057k-HP
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 13:21:00 +0000
Received: by mail-pl1-x641.google.com with SMTP id u18so5244646plq.7
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 05:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yztR7wv9WVTETIuuWQuG3q3HlE0Hz1iQ49yrKE0yleA=;
 b=Xq9YAwocZWgc932zPArJkdqerA+V1ciK9b+Iv+IP8hYVf4qhQuZPRCG2irY+0k7bzh
 s3sG7ed5U3VTKkxEXA8Zul293bJLCdYYNccgY5XMTObYUfTJGz4REgNfrDwPxXwI6+ZY
 hOKzHI6VikSXPF+xiDgYRxXFT1ph2WuF89ULi5ad+ug9Lsy2MAFqPZKba6KlHT6Wdtm2
 EGxUiYdfDBew3JnMrWcs1XDvnJNTkYERt8LqMxXiJoy5vRGpqJP5yRRKpuS4TvsMjseR
 9KM4sdimsu3BotCF9No5DeWVHcy6Tot5bzSxgmYIDn1an+d6W1AwSXWcGod7v+4vFkUW
 4LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yztR7wv9WVTETIuuWQuG3q3HlE0Hz1iQ49yrKE0yleA=;
 b=KOZiTOz2BH4vWBkQpgECV+6nZ9FMAkYtDlwg6Ir4yjv97Gzc4X0zhtQj4ApqFehSU0
 pHd6PMpaFMzjQWQ21Sv0GBnZjybWYzF46QgbkEjWWBnjJmMUKa8jf+14KrYbu9m+REeP
 9VF4+yCg2lZGyv5vooIg37b4vA7oFS6MeEJChHDUrCKo0tYXuBY+O/yElBl25nLtSYt2
 McZ95m8us7YRWXr7boFviBKAeKqyU8MacMzBpdulYXGmn2THBOQuQPbyjIWBh0RaQNRL
 8uJL82k6ztcAdN75cLtNaWmshfu6QLuxeWhH8QsSrG11nGI8MJFBqwx6ewFF/EQtT8Bv
 45ag==
X-Gm-Message-State: AA+aEWai1VTQjowlHSkLcUw7gnRSatO7FKjBRmhZm48yQgWctwXr7ZaW
 Xx2WmC6o0MbqQ48Ed257Y8UmxNExlAE=
X-Google-Smtp-Source: AFSGD/U9HskEw1WvAhfP2TUvcxP3L53IAJgZ48GyNzAwYfEshPRDZ0vRWSWGaathwsciJ06a3FCcNA==
X-Received: by 2002:a17:902:4324:: with SMTP id
 i33mr11820354pld.227.1544448048454; 
 Mon, 10 Dec 2018 05:20:48 -0800 (PST)
Received: from [10.1.1.7] (ppp118-209-129-45.lns20.mel8.internode.on.net.
 [118.209.129.45])
 by smtp.gmail.com with ESMTPSA id o8sm20100892pfa.42.2018.12.10.05.20.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Dec 2018 05:20:46 -0800 (PST)
Subject: Re: [PATCH 1/1] usb: dwc2: disable power_down on Amlogic devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, hminas@synopsys.com, gregkh@linuxfoundation.org
References: <20181209190129.11870-1-martin.blumenstingl@googlemail.com>
 <20181209190129.11870-2-martin.blumenstingl@googlemail.com>
From: Brad Harper <bjharper@gmail.com>
Message-ID: <81fb7231-8bc1-c8e9-4901-20676632a10b@gmail.com>
Date: Tue, 11 Dec 2018 00:20:41 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20181209190129.11870-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_052059_594146_980D183A 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: Arthur.Petrosyan@synopsys.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/12/2018 6:01 am, Martin Blumenstingl wrote:
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

Fixed the issue on the Odroid C2 sbc with amlogic meson gxbb soc, 
devices are now detected when connected after boot

Tested-by: Brad Harper <bjharper@gmail.com>

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
