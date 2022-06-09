Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8ACC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ujlih8RLB4fEBgpyNne+Uq7pPW4RQ7/3vjz9HuFI9X0=; b=Hkxecq+LKcUkCY
	0fvbBMlVWMow/Ifh0qsHvve+F+m7EbBSdyihfw+7Qs+ITnr2otnuqYzfiEtpbMuNREgB9TeoqaoL+
	DKDh7lTLsPRnMJ2qUmcM+JjaCLSOSC6UZ3sn83R2UglBFEol6EeK9rrnuVaOcccrZY3Vp/QT7Y+WP
	AZYuNZ/C+A9ohFBaB3BfruH7IFvbPH2oOrQgWA5d6zLa9c8hdQOZpkwviT7CUv9LXqt5DvBukEMZw
	QEII7vfeieHd+pBFE9KYKibkmEiisw+8wtNWbCzTjRtslLWBUTTqzMOM0OPacamFbgrQBEVlUzI+i
	UU32pPjQNsTHvMoTv8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzOOP-003tMp-Ld; Thu, 09 Jun 2022 20:04:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzOOD-003tGl-Gm; Thu, 09 Jun 2022 20:04:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id fu3so48081735ejc.7;
        Thu, 09 Jun 2022 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hHccYO4z5usBojn087eWGV+jtlxg4L1Z0rSYUHXah30=;
        b=MzK55xDftqFwDPyfVCY7qiTgQHhw5KesPgjLEHgVe5c8iVsi7WJVaGi3HQShA5VfEQ
         Kn/0mRYQS73Chzq89V+ucqGUae0L6oTBbtkQRbknGz2rA/qaiNxFD22oFYTqCkDAU4EZ
         a+/aVe6nUWt4hKAQosJGv3YfLIXqFcS90I9GBPXwz+VnH4A41p/PhAHRX2rDp7fU6StS
         NduLvu5zanSz2LpVdKlLaZvlsuLPjgrMyntgiAU8noKZgFaLX9LU6wY6aTEHkp3SqXuZ
         59c/FZe+gEKxuZ/pgVYQZ+AnBvfYbshMkp90Fkaqe9Iu8ek0XMEp3B2Ez93Xd++aCQsj
         z66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hHccYO4z5usBojn087eWGV+jtlxg4L1Z0rSYUHXah30=;
        b=OmQfVL3e+f+ltqd+W2hOWSxTLvH6Ft29+ds9lYr45acyaUinCOO36iwypPYSAHPMnR
         1xRM7ZKsWzapbNUc8BP6+QjHYyMJKJUH4iZE74PoLNyu8TU2P0Lzkt8ZepwQVWfhIwXg
         4BYBbhMsJNAsNXTH5dGv8aPolaS2oU2RDN1gIuoMYmCzWo1mL1fNV+zastxCN8/UGyUN
         Z9T4w10ESmwsyPlJBR1LlnIQMdrUlVv/A0YICZjkD+mvbZj0bj+Pt+AjMJFuRb2/bYbI
         1T7FV/BLGReHhg17wOphhHF+LBXkAsEFO3ISqhHrUdOsPF8vAINb4GxqWMvoKt0rZ+If
         mITg==
X-Gm-Message-State: AOAM531Crz9ZDTXAXPCgiDg+ACRKcZUzhovFX4EvjvfFb2jYfVwFXlKC
	QdFIoqbv/k68fND4V+wFcwLGbBx0p3YvMz3JoVc=
X-Google-Smtp-Source: ABdhPJxfhhcOra1ui4AvrkvXdWpqY9OeKmCTNjSpjd2RoNGVaKcF2Dqv56z2FDMl582+UvxSiToI0PJmhOR4YpEYj9Y=
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id
 w14-20020a170906b18e00b0071026db7a53mr29313366ejy.290.1654805056333; Thu, 09
 Jun 2022 13:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609113911.380368-7-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Jun 2022 22:04:05 +0200
Message-ID: <CAFBinCC2A-Fe9QbZtffmCvHFNWcgaL-TZydwFBKsBp-n2sD_1A@mail.gmail.com>
Subject: Re: [PATCH v2 08/48] arm64: dts: amlogic: align gpio-key node names
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_130421_579926_B1EB1D12 
X-CRM114-Status: UNSURE (   7.74  )
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

On Thu, Jun 9, 2022 at 1:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
