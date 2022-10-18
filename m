Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B378C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Oct 2022 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gscbYiKJsULfpuedAFGb/uPXyT/2qwJ7t6PkXU3jkk=; b=ogjN2d6a9oud7h
	x1JT/vYZD1S7BcR5DulzwBwSQ0c2wAd0Fs/ZBzJC70YqGdBA9IhDtI5Si0E4drXTbd04H1VzVG6so
	Gb1CD+tO4DM8zhB3ISmrsFPyzFQ2ryCR9A0b2RinJffn4nYLVvtvmKCgiP6N8TRyHgV0hR2HbBw12
	89sssWyZZ6WFqMOnXBxwONXkYYuv0k4T3BELBgRIXHQtXYhyMDdYnzd6D0AEDBBx8TF9W5M1sBNin
	LjW3KsZu0b84mZs8fiL8spyjvrYmPQ4oHxVQU33KGXSUFj3eLJKg2FJBZFuOUIAH18X3N5cOC2sa+
	Yeqvqlw/m1m97zUarTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku0y-00AXEs-8Z; Tue, 18 Oct 2022 21:20:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oktwv-00AVHQ-0W; Tue, 18 Oct 2022 21:16:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id r17so35415444eja.7;
        Tue, 18 Oct 2022 14:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KXajiJoegweNIUxGXxwigTCCYehMZ/VtbN0U3Syfum4=;
        b=GZtaHJXRtY4TsE2W9IQ+H+7BU6CqzCVwuyPye7+0TsJBArItUPGkbDrJOQzqBxvU9l
         T1FEefBlxI56uU2aGOXliZo7cSZ5jlxXwlFbyZISFaus7J95p09TiHIviL4jCv4tiMQX
         0d+Z9DBu3WLYcCLgafwyBwtalmM4o0DFlemKqpY0d9ebelLoJJn3cJ6bUcxajfipvLpf
         x9F4igE5KEZwDjpmy8OkHOz8+M+iPDOvS+j446gJIab01uTTMaq8psrndjyPI8z2+5f9
         5cgIz30aPqT2lg7ijAr9r8uVKMzPZjAataDTOtg+YC+JcKsensankooabq5mHrvvjiAJ
         /VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXajiJoegweNIUxGXxwigTCCYehMZ/VtbN0U3Syfum4=;
        b=4wOdJ4F9JcieMJvKApK4j31NUe8i+5atBBWRcZcVCmlNltjXx1jNDdf1OxFmWLjWkC
         Dgqnjdjr7h/wkcpaiuO3GkLv4S/+SAVn9UHIMRNH5DCQ2z7r9QgFQZnPnD0YwKI9cgk7
         8E3r35c9M8wNJPBUIf4S7UA/ooayOBtFG6mjm9IA6nzl4qjrmCWLXklVRm58Dg1Kk7YN
         0371eIOfPNK+H6/TDYR2mfWZ1hAFw/IPrvugDQxoaKFFLID6NemekfqSpzvipF/+NY0/
         emU6PXg7r9b+ogpkPNWOSK6S/Ak7+5tBS1LsR3fc6vn1gBkcfDfWht8F5lySICxQUKdd
         v4dw==
X-Gm-Message-State: ACrzQf1ixk+J5774sLHJhd1dhnSz5Avm6IATFtp/vZp4cb/iVB+LFC5G
	0sWOa7wLskNCBbN/saO4tksaYk6AnyT7L3Wl/h0=
X-Google-Smtp-Source: AMsMyM59CkxYBd3MHKQ+h6wmgMtZtQuYmtvfeRdv+9KWMvPa2MnVu7LorvjV3qm3NPxt48vIO8BXr3tC8yXz2NwjqLc=
X-Received: by 2002:a17:907:3c81:b0:77a:327a:815f with SMTP id
 gl1-20020a1709073c8100b0077a327a815fmr4116855ejc.422.1666127790470; Tue, 18
 Oct 2022 14:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221018195122.8877-1-linux.amoon@gmail.com>
In-Reply-To: <20221018195122.8877-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 Oct 2022 23:16:19 +0200
Message-ID: <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_141633_098865_7DDCE7E2 
X-CRM114-Status: UNSURE (   9.57  )
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

Hello Anand,

On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Odroid N2/N2+ support active cooling via gpio-fan controller.
> Add fan controls and tip point for cpu and ddr thermal sensor
> on this boards.
In the schematics for board rev 0.6 [0] I cannot find any information
about a fan connector.
The schematics for board rev 0.3 [1] on the other hand document a PWM
based fan connector on page 16.
So now I am not sure whether your patch only applies to certain board
revisions, the schematics are incorrect, etc.

Can you please provide some details about the fan connector on
Odroid-N2/N2+ and which hardware revisions are supported (and which
aren't) by your patch?


Thank you!
Martin


[0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
[1] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.3_20190117.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
