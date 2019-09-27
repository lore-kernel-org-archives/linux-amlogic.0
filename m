Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5788C388F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 20:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9635E20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 20:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HTveZ0xJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHnc0vRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9635E20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZj2vB1HwRbvLZoAL/vkES+hQJjhrnGObFsxZlfONj8=; b=HTveZ0xJXCj9p8
	/sYwmyaeqkfwvRZKd2i68XEqSDMbzRqDdnh5SKsP1bbwx+1PeNf+6elwfnNDknC7FIQRwXJlKaiVN
	0gGuLUfYGWDGKm7p/JDowdygdfsuWgkfkzDsVOLaYCV+m1jgKqQvAljeTfUAXYMSgGj4JvIuNtadI
	v79xhff+bh37IL3x9yrZSdzGZ6le95s5m3UFyZXE1pRphXJLRWaDRZDTOcHN1IlpGhHF4/0y8IQt6
	WLEa4l2Z8WX5b9LOKXDs/GBN6jBR2IVTDAuVEoyncmPD9f8/Irt274yjoBUxkJszeqfQxVWDNCoW5
	q9DThhfOdtDvRtkh0evA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDwZr-0003TW-LG; Fri, 27 Sep 2019 20:10:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDwZp-0003Sp-5S; Fri, 27 Sep 2019 20:10:54 +0000
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFFD121906;
 Fri, 27 Sep 2019 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569615048;
 bh=b7udfW27kUSAKzBz/klbWlqHmts0w2AZWPzY+ISPsnU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CHnc0vRGRCkhh6nfZRCObkOauHnm908L8O4k82Ewh33NujxymLEmDc2uRZj1FOI+O
 br/tBVj0/IipUySKwpM0V2oHoaP+UU9KGRbNaeEFxDhY+wRlQSxdmYXYxrA6vSqpt+
 FtBQtbLt5MFvnEY6w7vnWSi0OAGQ+5DJaO3QnBtk=
Received: by mail-qk1-f170.google.com with SMTP id f16so2993756qkl.9;
 Fri, 27 Sep 2019 13:10:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWntGVJUrmdQHvIq+ogsPphqr5XBPELJgUzoIw+u7Xo6JnZh7W3
 5a01P97jSYdya/PCASqkY+bMDxt/i+6V4AQ8JQ==
X-Google-Smtp-Source: APXvYqxKy/HEii2/OoHYOAb41fJRQion1dSlPGS5FdM1aP8Lr6iCqSO+cRGGzikOzCqBYhvNXRHDJuLbTpEBmBQ5OGI=
X-Received: by 2002:a05:620a:7da:: with SMTP id
 26mr6292676qkb.119.1569615047714; 
 Fri, 27 Sep 2019 13:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <1569411888-98116-1-git-send-email-jian.hu@amlogic.com>
 <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
In-Reply-To: <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 27 Sep 2019 15:10:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8r-8J_bSaQax3cJkOUL8D7P+6_PcCqaC1k8=zS18moQ@mail.gmail.com>
Message-ID: <CAL_JsqL8r-8J_bSaQax3cJkOUL8D7P+6_PcCqaC1k8=zS18moQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: meson: add A1 clock controller
 bindings
To: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_131053_231104_A5D4A474 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 25, 2019 at 6:45 AM Jian Hu <jian.hu@amlogic.com> wrote:
>
> Add the documentation to support Amlogic A1 clock driver,
> and add A1 clock controller bindings.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,a1-clkc.yaml |  65 +++++++++++++
>  include/dt-bindings/clock/a1-clkc.h                | 102 +++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> new file mode 100644
> index 0000000..f012eb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */

(GPL-2.0-only OR BSD-2-Clause) please.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
