Return-Path: <SRS0=abhm=FR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52508C433FE
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Dec 2020 16:59:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E2C23121
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Dec 2020 16:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E2C23121
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QHh98D8i8SfM7UJZhA1TN+P8K7wQGwGZ5x2y8w7/vwI=; b=hkaTtc0cjyMO9S6BwphPfh0CL
	zhVUjSKeVOsq/XhRyw8SrTlICMhehw/FprCcE4KoeDutFOfqx06kNenB57BSTnDzSlRIQ0cPVa34b
	UDu/iqs7yuEJ7ABkySPJjsfTrVnTtUWVDqc/uJsoK8WyuEkpXu0wfkBAXvfwtKBzLHSKE8WU3645E
	GVqveqPWY6WxBC/G0J8LZLO5g8qt6ie/ge7yrBjoMtqNA5RQ0iPzHb6CEj+BjDh5q3V8dPH7jVODt
	LeHqatCc+w6eHviiEo8X9G91av8c7TDSzPOKZmh87MLjtWfLTtWKbCL7hFL4JF1VLliuTkCGZW7E8
	wfxA7VJKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koUiR-0003Kr-A7; Sun, 13 Dec 2020 16:59:23 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koUiO-0003KK-Id; Sun, 13 Dec 2020 16:59:21 +0000
Received: by mail-ej1-x644.google.com with SMTP id jx16so19259546ejb.10;
 Sun, 13 Dec 2020 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=II3z2KtGXYfccGsk4AiZsYqrzwoXcVMGnMLgumJisoY=;
 b=SAHUtmIarY7j7e4zeN3fFvTYIChAGt+Y7GNnQPhDC0+IPhzQJopCVLzBGPCQ5eFaiq
 L6j+nOGMJgIGwajqVssbzaKzuaBQrpADs0OPacCgrLoEUP89l+DvXKAWnAI7YZxJT/Ki
 T7PGOUupcgHjLrwfXc2TYUJwa1eoPQ+yowBNhUhZpvn4SCLxZ32xYEjt/x+jtPK3BTVB
 x90FSoflQ/kMvA2zgF86AeYL9ftHV+sy/51siMs2PT1oBQDRWywhaEfHUE0mmcAlTVUC
 5oD4MqiKMIyunrjoTks9w9RC/Lr8kaqPOqkxeZ8XwBfRzC7g6XqBKTUY3mKrc4SYbm9S
 N83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=II3z2KtGXYfccGsk4AiZsYqrzwoXcVMGnMLgumJisoY=;
 b=lbfqM3564VDEIexwhyU9WTBQYFzKNbJ/CHdXHyEuaIFECcYGX1/dzLEFnzHLyg/yAJ
 2k/u/f9Lv+Gn1xL7HujkJpLph+AkXzjn5MA29C/G0U/EGx4nqQ3d3sAt/peEWv5ff6SH
 73gJX0TE2hWAlxaoLU9TGo39R4nGqNPwhiD6Wh9F7KXb4biSyaUkhmHYQqQABbwYY1a/
 EQKOIkHxVO3KYDg9rbgC576vCwZj5ZWVjcYPOpLErCBl63Ozl5+TB2GYv0KFyoypf/31
 WhdwWjZ4wP+wvVCHtoYOfc86VrenW7R6MnmxHNCm+hw2PjcVQsVLLtUhFo0jfde+wkc1
 HSqQ==
X-Gm-Message-State: AOAM5331jzYT0dVnIDrGVDkAk6jBLMEfDfXwXygCSq7NKES8WoPwvd+n
 HiBn3GRY1RCPKJSluMoge6um25PdcsdS0zGT8/o=
X-Google-Smtp-Source: ABdhPJxTfbMDN5oNcaUz9aMPM/tB7U1x+Iz17INemv3bReSILPHPG9p0mVcWKxhWANbZ6WNgGkXDAuybmWqfDwG+G5s=
X-Received: by 2002:a17:906:2798:: with SMTP id
 j24mr19280203ejc.328.1607878756610; 
 Sun, 13 Dec 2020 08:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
 <20201115185210.573739-2-martin.blumenstingl@googlemail.com>
 <20201207191716.GA647149@robh.at.kernel.org>
In-Reply-To: <20201207191716.GA647149@robh.at.kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 13 Dec 2020 17:59:05 +0100
Message-ID: <CAFBinCDXqnPQtu4ZQW2ngxKVSbRQNFbnhy6M04gE+Mc8HOTM8g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: net: dwmac-meson: use picoseconds
 for the RGMII RX delay
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_115920_644257_2D6B5564 
X-CRM114-Status: GOOD (  17.27  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Mon, Dec 7, 2020 at 8:17 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Nov 15, 2020 at 07:52:06PM +0100, Martin Blumenstingl wrote:
> > Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
> > delay register which allows picoseconds precision. Deprecate the old
> > "amlogic,rx-delay-ns" in favour of a new "amlogic,rgmii-rx-delay-ps"
> > property.
> >
> > For older SoCs the only known supported values were 0ns and 2ns. The new
> > SoCs have 200ps precision and support RGMII RX delays between 0ps and
> > 3000ps.
> >
> > While here, also update the description of the RX delay to indicate
> > that:
> > - with "rgmii" or "rgmii-id" the RX delay should be specified
> > - with "rgmii-id" or "rgmii-rxid" the RX delay is added by the PHY so
> >   any configuration on the MAC side is ignored
> > - with "rmii" the RX delay is not applicable and any configuration is
> >   ignored
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 61 +++++++++++++++++--
> >  1 file changed, 56 insertions(+), 5 deletions(-)
>
> Don't we have common properties for this now?
I did a quick:
$ grep -R rx-delay Documentation/devicetree/bindings/net/

I could find "rx-delay" without vendor prefix, but that's not using
any unit in the name (ns, ps, ...)
Please let me know if you aware of any "generic" property for the RX
delay in picosecond precision


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
