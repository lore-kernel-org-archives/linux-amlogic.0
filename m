Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DD3CA1002
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBPGw9v6Qzn+H7TftJ69Fiy+xe9oPoZ6cGkP/4bJKTo=; b=2lfpPH0ARXTzf7
	i0eHHCIlaUlL/0qi+UErTJDEwCWo7vqg+G6OduIiv20GteqNcQql27QZW9Tki1djPSG5sjOJYpm7D
	c0rFgsmpDFwAn83jeQ2RcLZfC6HWDM6dBZSiSTm47YjLjlHw7cxxH8aayZAfSYOidtUmlHFPGudmj
	0EXvjRreMTZaZ6DhnC8CuFmIP51Q400BbdeePpgUWp0Ob2gIs7xorbel8+6TbIPsQCTiusA9edPUD
	GKFtfmnYCDjAeabGuuqAmXNdTDzG4Ab6jRFxRgrE29PkF3khADW512WXRjjWtfgODJvz7Xi5+92m7
	85w5qJa8jHPAC0bgHY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9C2-0000000BbSq-233O;
	Thu, 04 Sep 2025 12:35:58 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7nM-0000000B61v-37xb
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 11:06:26 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d60504bf8so9008077b3.2
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756983984; x=1757588784; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qqKmJAcNXHCDcjaAnbZVhbmbW/ApAzLJDIUDuK/HU4s=;
        b=RI7lkc/fKcfQr6YZdSxpHvZjgC2TQEUrYIxFbGQFbwiwmbA8LfhH4EZTX1vk1Jn+XW
         N+PVmM5eXj5EmwvSYIg1xaFJZPDH3P9RtvTVw/vHlF1z7S2G6AFqtzvJYW0gvt2QfPWp
         QCPT1OAEGkfqtJm4zX3ylY/kUPvS74WZ2ddAmNvXBme9wbzlcXEzOjnRusyqB4dXgt2x
         XZ+F7vjnmFhOlMMlYZKLEGppljBkDSDoOykCDJESMyzo2czeOcEmBB20Yz3WEdn+yPAJ
         VK6WlLOuo2OcJjpCBfI9N3utVxJmfcqRRN2RtiRVsPZHm/jETRIZDQ5PJ8QoB5o5f8aH
         OazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983984; x=1757588784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqKmJAcNXHCDcjaAnbZVhbmbW/ApAzLJDIUDuK/HU4s=;
        b=HKbK1vBec0ZS86fOViTX44WxTlhK08fi6jI1c+CXxCULa0Hv3x+OyCusTGFTuTuIYn
         x+sJIxnlMeqvV3fCVEcAy1ylum3kgxNQrG1uq+Bg/HaqCxE5tXA11rHYDNpJtX3FEOZr
         oKn7VUSrslHsVtvTWEuOYhJWXpKP7Ud4UI4n/9ChaLCezElZ70zs8RkdukO4HSho0niT
         rxFU5rDqvlWN7rZl8IV1Y/Y50VBKhl5+L+tEmTpKMlKUE4vQHcYc0FEzS4fg0PU8nlSd
         TUbu7B07xHocyC/xUz0twnUvga/ouzb7n4dd5bIXM7RW5ViJ7zkhCEt26E6ETDUuALQt
         Tx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR0sPQ8C4J4Jk+j3umgNKtdMb4tSGjZKvRrQSe9xIJbqaE2EWsSuRL97W5EhFwDI7cA5GL/heRRy8vyS3l@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxuet7A+ocKKpDaEhAzGJ16u+4S5CQdAc1RIpvnO1uq4dxSBBN
	r2eMfCAWrufNc/+rh6XHEI40I0501vRS/NIeFysN6bIionE3G46iW5lPAimM8HfI9jYF7Gw0Hbt
	nYXnTa2SiaOwO1zY0NNmg47eAtuWQTNV1LTl/Q2lQaw==
X-Gm-Gg: ASbGncuLZlEUpEj8l/075HskAN09jqq+yVqd9Hsjq/ptXXiwVYrtoON3C2zI+WV7kXd
	lqgZ+nkOPhEcKMqKLyyaOAazW5WPAaLb6czANHXh6DpETso291aSKU5FAvEs6KTNqnRKBtR4Zre
	d2ZPIR/BmClK4XgY+UgqqI0fGTDpWbtjHZ5UR/SCf4XItJ9qMQWCI93RCcEI3He9jochUtDaCon
	PH9BoI/
X-Google-Smtp-Source: AGHT+IGqecQe5yOp9cR8x9hlAxxhDZsB8TfIupcC0FJtDt5AMK3d6JhTkzzkgdPyrWC0L7dsYj69W3txBCo/Z85TaT0=
X-Received: by 2002:a05:690c:9a8d:b0:71c:1754:2696 with SMTP id
 00721157ae682-72276542673mr206178927b3.36.1756983983654; Thu, 04 Sep 2025
 04:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Sep 2025 13:05:47 +0200
X-Gm-Features: Ac12FXzzO6lh2XeuKq6zK_9jSCFOJd4db2W5dfvQA3Y4rmF6D3oa47ZB2y7XJS0
Message-ID: <CAPDyKFo=pwb43vZFkKprbBthxAy_YtYD2mKitY6Oe-rMHYCkDQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Power: Add power domain driver for S6 S7 S7D
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040624_782191_A3808FE9 
X-CRM114-Status: GOOD (  11.67  )
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

On Fri, 22 Aug 2025 at 07:41, Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add power controller driver support for Amlogic S6 S7 S7D SoC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch 1 and 2 applied for next, thanks!

Note, the DT patch (patch1) is available on my immutable dt branch too.

Kind regards
Uffe


> ---
> hongyu.chen1 (5):
>       dt-bindings: power: add Amlogic S6 S7 S7D power domains
>       pmdomain: amlogic: Add support for S6 S7 S7D power domains controller
>       arm64: dts: amlogic: s6: add power domain controller node
>       arm64: dts: amlogic: s7: add power domain controller node
>       arm64: dts: amlogic: s7d: add power domain controller node
>
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 +
>  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 10 +++
>  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 10 +++
>  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 10 +++
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 95 ++++++++++++++++++++++
>  include/dt-bindings/power/amlogic,s6-pwrc.h        | 29 +++++++
>  include/dt-bindings/power/amlogic,s7-pwrc.h        | 20 +++++
>  include/dt-bindings/power/amlogic,s7d-pwrc.h       | 27 ++++++
>  8 files changed, 204 insertions(+)
> ---
> base-commit: ffeebf7587f518a3717fad308cf735adbbcaba97
> change-id: 20250820-pm-s6-s7-s7d-950f720aac6d
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
