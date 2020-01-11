Return-Path: <SRS0=NecF=3A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C452C33CA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jan 2020 20:54:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1EEE20866
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jan 2020 20:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="joNM3as9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dEMbuvbf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1EEE20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uV4p6FCWeNRDNiVjJ4IeA3gjgTfGBLjp8qfrG2qwmGI=; b=joNM3as9pzeZ4U
	cQSK67Is4mD/XKrBG6Udgf48az5pV8VgDgkzHIZQwCbMdG4zjEb94jz/MLfRjeY9gOeWGzZQWAjZB
	Rl2LLsem3UqvbvztxhKQp6co6ekmPjtaZ/fOI070MNi54nKOF6DgCclpurZ9UGzfs4f+5t5R0drw7
	hgOt3V97wXOtY0P16P7jAc/nHr4E9AczHA2pbD6TsmmVsd3OQA9NH3bgR8P1J/tSJoCsB9TnZt1Pr
	OqR4wbDbsirxXWzogP8Nwp7uspAi1QXUO7fEGdGn8SCsGbrmUTegKYqKbj/dzfXhvNhERAeDvo9g3
	EsrTfDnmhkskI5xtRWPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqNmT-0005Wy-Py; Sat, 11 Jan 2020 20:54:49 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqNmQ-0005WT-LR; Sat, 11 Jan 2020 20:54:47 +0000
Received: by mail-ed1-x542.google.com with SMTP id b8so5023170edx.7;
 Sat, 11 Jan 2020 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0OTy5bWu7ituTAMunYtNOtrElBjU8L+HwcC81VLSIUU=;
 b=dEMbuvbfWaeBtraw9zZnV+PFA3wKM6TgNhF/CzZBEfd1V8JUoS92jT6VjaJCrE9gXo
 AdA397m17nAsdbmHVzi/A54qDJGQkvCBDk0bzmkxK2xgkE8o1Y0YJ+7UD05EcPSpw5iq
 pWo0pQUZHHNAF51LhyEka/D/egFoXXB4bkAlTV1UDiuVSMGjJjMxiZGUvC5C3R5jD7tk
 wVdpcnNhF63CQHqqspIQbn4FMtAkNO7zNIWh6k9IEb/cfocRUIsu0e2abEycx5O+DdB4
 +kpfzn44pjqdPF4vqydMOPR69Ph2Pf4Rq4DDnJlYgKDIKnUXlhsXpF8lz1u5vH8jwda5
 6fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0OTy5bWu7ituTAMunYtNOtrElBjU8L+HwcC81VLSIUU=;
 b=o9VRraCICShEswQhMuypgyAHAPimqbM3jd1g41jzdaupu6Ujx4J3OdHNR/jhn0qmfE
 TEFYpDH2Q2zs2RJG1sYf1XaYtkGvfMkoK1Rphi4qMeuDAXMHEQShYG34KUfR+sFUxP3j
 fhlM4W073AQ9P82+eKt//qEGyHM91hgGa63+JJqfYj2vQHV6MzBkGRpCvmltIUkpY3U8
 AknLzVG7dQFkEJTQLz9i3vzrvei7LBW5oZ7vi7tvnkOqFBEmvu4eXK/kejKj0FlUpYsE
 GpxsyZEowZkgdroie3sk7PPUWdVKbdb1px1OrLHgMKKlZdlxKveg+hm0F8L4Q0gVwkoQ
 KfKw==
X-Gm-Message-State: APjAAAXhvIibKQi3blQ5QaSr4rxGkfZwhsqePVxXeNItjqOuNTFF8OFf
 AwjhmCuAc81As8xnq7bCspx0K/EqPKKpVBLd0qUz/Or2
X-Google-Smtp-Source: APXvYqz0LCEetCL0C26+oJCqz1q7IMN4akVRCVVYqX4oiFOSFM3JsgRptl38/YKtB70YcL7gMACFa0zGeMazXQEl06o=
X-Received: by 2002:aa7:d511:: with SMTP id y17mr9783140edq.41.1578776085155; 
 Sat, 11 Jan 2020 12:54:45 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-2-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-2-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Jan 2020 21:54:34 +0100
Message-ID: <CAFBinCA-w6GnPzFCbmUFNrOY3PeW3=74+ToC9CvXoSAWoe+VLw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_125446_707731_EE578E5C 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Hanjie,

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
> Add the Amlogic A1 Family USB2 PHY Bindings
>
> It supports Host mode only.
>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
there are only two differences to the existing
amlogic,meson-g12a-usb2-phy.yaml binding:
- different compatible string (the existing binding already has an
enum, so that would be easy to extend)
- new, mandatory power-domains property
(Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
has examples how to make properties mandatory based on the compatible
string)

have you considered merging this with the existing
amlogic,meson-g12a-usb2-phy.yaml binding?
this is not a "must have" in my opinion, I still want to hear your
opinion on this topic!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
