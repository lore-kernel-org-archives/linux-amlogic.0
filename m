Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8058DC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Oct 2022 21:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwPOdDp/DOIpQDRaQpFmU2IU6lZOpWz4gjB34lmeLOo=; b=KUwbGw6xcuRVwl
	J7tsq+9eSEOsNwhXJG2YYzBNUXcqlY13wXokO7ns1rcB1J9dKgx0HC6QcEbNeR+KjTWOV7/tYKxes
	TAazEBP2HiTx0cUBkpnakFhgmRX7JhBQNEPXfGCS6Y6SOs1gqc1qQ02HYI8ccafHbOgI1uKQvw6zy
	wDT5M2GNl3BkcMdq9/rPVrLZ/lqkRYJJ6QKISZkwVLCo79U/Qhlkiqx4oOQkVoRqULsP9oI+Rrgx8
	kyuINl5kAJl6f8YZSIHvwMQK6+jrmHXxaAOLUTdSQ3HkWJVwRKYw2MH9T/Ou19EOE+WdBZVr9JtD4
	puW9KWUwPkNy/EuFvBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku4C-00AYhe-Lk; Tue, 18 Oct 2022 21:24:04 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku48-00AYf2-UL; Tue, 18 Oct 2022 21:24:03 +0000
Message-ID: <e645c42a-b4f1-a0fe-1269-ff380bb1ab05@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1666128234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0BsEcvPhkmGUdhefsoRzXvg+m3TVMbdMVKPxzr/HVI=;
	b=GYRWm2gJIBcfWa1en/5Gqx9cW3PzEwFCyZt9lzd376GxQIJiZUIzha72gPcCKh7sIx7ZgQ
	orEFZUa6J/baErJzztWCPFqyvS2yeRCPI04Vxc7NOXiiNPE2F2fSiUBuWW7szLJjGX2sFO
	gqoFzWTkI8Ry3VXnWzS0BdRtIMwwnaVk2Tn8ZjYfPN4duC+4Wdkh9fBXYLe126Q7fH9Xoz
	o3iMGIV9ZM3gOhXZ04PgBy9ZDYVqShLj1vibDBEa4J1jDhUZ9RHEJyK1UBhpikOyCRmI1U
	vaEADVtXFsO6KpNDb+VFxRS2x7E/MkYlbQ1FCoh9psJBG8kDXssizxKww2IQzA==
Date: Tue, 18 Oct 2022 23:23:53 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
Content-Language: da-DK
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221018195122.8877-1-linux.amoon@gmail.com>
 <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=strit@manjaro.org smtp.mailfrom=strit@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_142401_501545_06C6C62E 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Den 18.10.2022 kl. 23.16 skrev Martin Blumenstingl:
> Hello Anand,
>
> On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
>> Odroid N2/N2+ support active cooling via gpio-fan controller.
>> Add fan controls and tip point for cpu and ddr thermal sensor
>> on this boards.
> In the schematics for board rev 0.6 [0] I cannot find any information
> about a fan connector.
> The schematics for board rev 0.3 [1] on the other hand document a PWM
> based fan connector on page 16.
> So now I am not sure whether your patch only applies to certain board
> revisions, the schematics are incorrect, etc.
>
> Can you please provide some details about the fan connector on
> Odroid-N2/N2+ and which hardware revisions are supported (and which
> aren't) by your patch?
I can add that my N2+ rev 0.5 does have a fan connector.
>
>
> Thank you!
> Martin
>
>
> [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> [1] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.3_20190117.pdf
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
