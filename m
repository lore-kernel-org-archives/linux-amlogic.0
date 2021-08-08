Return-Path: <SRS0=9aIX=M7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF0DC4338F
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Aug 2021 20:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C896160C3F
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Aug 2021 20:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C896160C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pg74eA8rX/qtn4/9WJZET2Xc/qUdywql9sWhEpKCaVg=; b=buGBYKDjw1IWuj
	asRMoeOJU2/yQYfSslWZOYPfQ+8FLjkVSFp4Eu7gq/AvlkSTJhnBEopKoNcB/7iyWoygTjysKfDZr
	uiMk9hqYLCP5nTbP9PiQRL09sBO0aJurz4VXqO6+TrhUIikHEMnatiHdao3gfUKFlEg+neIbd0ery
	+fHfwBs4iEiSpJdNOzVUZkLIeXk5oMmmjSJkxmLYPnaG/GsLitd1eOYRkIsdrD0mmc9IdfrC05ylp
	vv/d3lwThomUpcMaeGjKZDsVaQnvloRdnWVMbfetJ1mvGoaD0Hqp9QhTXurR5ro4HTm1eCSImoT9l
	1cF+RChrqVE7Z1DbIIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCpkj-00GUEx-Si; Sun, 08 Aug 2021 20:50:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCpkX-00GUCe-0i; Sun, 08 Aug 2021 20:50:26 +0000
Received: by mail-ed1-x531.google.com with SMTP id z11so21447211edb.11;
 Sun, 08 Aug 2021 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7CIvbNuWQrRFDJO54GmZe7iqsy+1L6US8bxbF34vLd8=;
 b=EgFKXdXZolQIDWKX/1e7+uHA9itMkXe93xCFp7VhDdIdM1d2ZCGrMcdJUVswPRWd96
 ajAk9Bov1dEZ5WHBYxW4rVrhZU1hRm4dWAZ/JFBUcO/SS84T9oZL1Z0HbKZKKs0Hq9Aq
 pRz5PbS0nJ3fWUyHJJwgxUxo/8LQobSvk3py615wsicF3rzEdGOYWp/6dqeNDmxwJ/Lf
 jzh9U4JmlGdPhiFot7DR4pYYqj6s0CShaK9DrMJIgq2C+jWSelcD8vnQk2MoX89rF19K
 uY+HRLGKHyuGyFzO8CcDYA2DhzPEfgXksKHOFDb9VkecqziQYq6eBq0JILha5r+9edwO
 sJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7CIvbNuWQrRFDJO54GmZe7iqsy+1L6US8bxbF34vLd8=;
 b=MdaQcUAN13gqSXvrnSWQ/Dh9Z3gQZczWBwcAXArVe6YBKT19r/8r89VG0s/IDco2Yo
 Lz942+D7A7egw9o/6E0ftekfn6+75NdWMkgr6yj8R2vSE8wTYZM/rkCsSH5DqnogWxUt
 N++YO1jIwkQztLfFs631Yc6qHnY/dr5bY0oIJErSX3hO4ZB3MwFeDyKaDfYErXHRaR8k
 t6KaFwxTPSMHQ7XUvI3qcC5LVZubhspvGfVywpVACj05ivmKWlMWt1109Jt+luo9EF8I
 ZPooO0SXLIZxK5mAU+KYdbKpkjTF+igxCXgryakQgxWF5DUvmMzYKgtwx8jEtFpI/6da
 uaTg==
X-Gm-Message-State: AOAM533czXTxQ8F5dmgVuOK/Q+FqrJduchh+vXkfv5wIVP+HkBLdkZ1Y
 aVH6ib9ht5Uy3ImF4xvHLx4bXOhp8Y4Jr2HHOIE=
X-Google-Smtp-Source: ABdhPJwHyCrOq/EpJ8M83NXU4cCw0Q2UbyxbppGA6JvEiqQhFlPwP57Z3W+bMLyWMyD8g+xtlCZIuGUhDbgrSEDHKCA=
X-Received: by 2002:aa7:d3cf:: with SMTP id o15mr3406276edr.98.1628455821445; 
 Sun, 08 Aug 2021 13:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
In-Reply-To: <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Aug 2021 22:50:10 +0200
Message-ID: <CAFBinCBKk_2Pk+8Uztx3yN8HSxiDcCW6VTF5duX3SuX+B8bzjw@mail.gmail.com>
Subject: Re: [PATCH 1/9] usb: dwc3: meson-g12a: add IRQ check
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_135025_122160_0EA639CF 
X-CRM114-Status: UNSURE (   9.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Sergey,

On Sun, Aug 8, 2021 at 10:37 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code. Stop calling devm_request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: f90db10779ad ("usb: dwc3: meson-g12a: Add support for IRQ based OTG switching")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Thanks for spotting and fixing this issue!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
