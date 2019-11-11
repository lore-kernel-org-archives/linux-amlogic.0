Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CD5C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 00:38:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB072080F
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 00:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ubKtcr5I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrxyRkvu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB072080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1M7S1jEWUNpMXZwjWdZu9Rb1GBbJ5SGmDn43CkUoKpE=; b=ubKtcr5Ih79JhX
	lM6VN5E/7ZDMcOGpl3gG1eN7WXGz4WrfMnNHFbLQfKCmyZJjc1YKkByYSxtEF+rDq6Q6s7gGrFsml
	LRa6cLXxr9SNKQoADjIliNAofM4B8bh4KQSgE6fTe5TZXRNBkUJgzmXZMrDXvdbSZBqpPqFlWH6Z/
	8FnQpgqLF3FTz8f3R8Ijen/bDMq/ZL2rVPXuQDrEzVpIzT5hyqg7eqgRUpWF4dCOCND5CY8F9uuZO
	DCPWchJt98wyvD7OfdhhkGYj/9KkyarXI/bzlizRhqA4L2RXw2sOxza4A7vHmMkSJz+aZiH6RSZy9
	qLJXE9OExVFGyqaaLtJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTxiw-00060a-VW; Mon, 11 Nov 2019 00:38:30 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTxiu-000607-G3; Mon, 11 Nov 2019 00:38:29 +0000
Received: by mail-ot1-x343.google.com with SMTP id v24so9898615otp.5;
 Sun, 10 Nov 2019 16:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MITFevQWeaD5O2RIoepB+ZayRpQUR0r8MODVnsurmHw=;
 b=hrxyRkvuCqPmRi7dOr6QloTOriYLjemurMepZlY4zMaONRKmf056kDCZBXfufatBYT
 Mai7D42x0uoj2oUgL7U8hWi/jIGE3EuAq7I7/wIpIDvlFE10oEBMCxAJTS39t5h+7j6K
 OjShnzfNpkOzT2F/vE+X/QkXbfF6Qxsy9GbJtxOn8V0ZBtq/5g985Akok7ymRYpjyk9N
 npZZeL+0TWPrcRnHA4jmEmFcPB7q29Pag+derE8iJWjHs0txUquuoO8imPxADPumcpJx
 Xkr0qV5fXsDWD1r2ynDPlOC6ZjHhJrVA+OyFujJe8uMjC+TSwW+ghYYa5MB4gLiuii4I
 Urcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MITFevQWeaD5O2RIoepB+ZayRpQUR0r8MODVnsurmHw=;
 b=CR0/JF5NVNAHu2VImSnCjAl7NDavIHys/zQfKJrrrTFmQrqljg334M8k6a9n0PJbhU
 VTMK3iUd16xGdg/UNFvJH0N8nTuJOr9FOgkTl515VGej946ILaHrId3zzU3cyFYmoQxD
 a/RxV+/LGMaW/ZAPJ6DnOqxuEbEZDvbV/YzlzTORr5wD4+83d+mFO27PQfyVj3tZQbWR
 rGMtcZ/dvKeyQI9KSFK62plhzSAPJTV/z/U9lRPkVXlcsjdkRJdfXYUs2pQWmawqQr0e
 Sb+inNHIWNmJnu7E7jNWC/a/t7VxoGkndhAMMVnKWQ6h6IAXlFad9XTXfmh4h0ZrLXbH
 iKqA==
X-Gm-Message-State: APjAAAVseIZapypCwgChQFnm1FwkVEbAR7IVPOJwf/nEejpo4iTEx3QS
 i1OvDtqU5wa1I2mDi/5i9eGaWd9U3c9jJjd8BrR3VQaEKC8=
X-Google-Smtp-Source: APXvYqxe/TyVhscrKc4YzaCaKaXtvQ/H7LFIz4ExngxMQYvTn0rZl5BW6m1HBPuay1wW4pphbzjm7aq+P5J+K7PBqMM=
X-Received: by 2002:a05:6830:1149:: with SMTP id
 x9mr18153786otq.47.1573432707368; 
 Sun, 10 Nov 2019 16:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
 <20191023201141.GA21235@bogus>
In-Reply-To: <20191023201141.GA21235@bogus>
From: Tim <elatllat@gmail.com>
Date: Sun, 10 Nov 2019 19:38:16 -0500
Message-ID: <CA+3zgmsJPsvXgsjDQKKrSG+UNdY3SK+hKCTD2X3hGG+OXejHig@mail.gmail.com>
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_163828_559033_1EE58114 
X-CRM114-Status: GOOD (  12.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: balbi@kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dongjin Kim <tobetter@gmail.com>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Thanks for working on this Neil,
Is there something that needs doing for this patch to make it into 5.3 or 5.4?
As previously mentioned the patch set fixes the issue on affected hardware;
    https://patchwork.kernel.org/patch/11164515/



On Wed, Oct 23, 2019 at 4:11 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 14, 2019 at 04:17:16PM +0200, Neil Armstrong wrote:
> > This patch updates the documentation with the information related
> > to the quirks that needs to be added for disabling all SuperSpeed XHCi
> > instances in park mode.
> >
> > CC: Dongjin Kim <tobetter@gmail.com>
> > Cc: Jianxin Pan <jianxin.pan@amlogic.com>
> > Reported-by: Tim <elatllat@gmail.com>
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Sigh, what's one more to the never ending list of quirks...
>
> Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
