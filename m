Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42854C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gTZ/vmWti26F5jKDFa4GOzSMS88UYrRSmFfLqAozjY=; b=QsAH2lS+swLvrY
	HMjlJ1kie3eRsaKe4VJ7cEwOHoUzMUOFl6A2bFM8BfGMv8JzmV2xV4YnuoAHqekBFgCOIwTGsLgQW
	HYOEatMXAKqoD/0B/CysDdFvWz1bZc/Sl7iLdHiQgvDgqG3NIZl8uJ4fTToTbI1C6Hlr7NxmIfGMT
	oth4x3p5+Ebjmw3Pefg8fe4XABXwXnUxIREqxAjIx/tiDkl+HCFqLjBSSbKpp8Ba5jmQOFumvUFCj
	5iXbUbbKRk7aBKXA/APcjzxGJ5jzXvbfzk3YIEqEKe7s9rOkab50xHJXoXHmmT/FmgKXfKY6q4sbD
	wzYsERqAmKzNeV/FNKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQvpc-00ACTu-Hb; Sat, 11 Feb 2023 19:46:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQvpR-00ACQK-3T; Sat, 11 Feb 2023 19:46:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id qw12so23326632ejc.2;
        Sat, 11 Feb 2023 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2AhTCgEyNW01Hpz3xoMcaeloiLVbQZG4MDKBPmxYU6s=;
        b=j0X5ehi1qAfwx88YgGhGEDbyYiu+Rr1ydszKqhaxGYwiDHTtCYroGG0h+JiDG2YKGC
         RyCQd6DVtp1pPQF1BczXRcDR16kC4ytbs6KFJsIAIgtr2RcEvnwzj0TzfXoBGt4jVyUY
         iDroILtZ3OzJvKdSgooY6MZBx7pj3QtO4YTRCcw2DptzPLdLZlkVdkL24T5WIsaGQ2kI
         0/sAhFA3ZiWrsSmitS7vkPR7iEt6AXQ50US98CVAYSd3vcMMGHidTmta/urAFxcraROz
         CWQaI+PKeWTf7UEjltapF3T/aIwaMtC2PVYr1m3pPRlhTg8IvznjPhMDMlUfqTA9D4Kq
         s2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AhTCgEyNW01Hpz3xoMcaeloiLVbQZG4MDKBPmxYU6s=;
        b=6a2U5mvRSLHqHdBm2sYouSPA/WIigA2Cz1VaYz4UEp2TkcIexq2QMk/WLo+xIAPF3D
         e2pZWqvCGkC51aDxK9HCv1WefPGRRNZbVmS8fmTfVfy93Jo51Am+deYkM1hak/5zNIie
         iH4V31udb5Q1KlewhLqLG8Crn8rBu7JJQ26hPbReU+rM4kQ9rbTokRXITxPd8XveFKvF
         q6ZzJBz5yeX67BHc3QrMxBHLSQmFtzhJ1II2BzTyCeDzWweIxoTZMlot3mNJ7Es17d+g
         VExEoJ3dK45DlaVWDW03eOhL9PvNDXsNCoRKj7wlo42FjDVMrgIgYKaFZMJhDnyh77ZW
         BICw==
X-Gm-Message-State: AO0yUKUU36VcDMpg3YwLlKGeH/vWzd61AJ+LOhfUNe9vQZgnwhLY9KGk
	bwvdRLxjJKj1d9is2JmkvSftG7RNenV/2Wo7gZ4=
X-Google-Smtp-Source: AK7set/nJdmi3PMS/VE7RInIufqL6RVJYPN9xEhALHj25oE+x3WlxzfNBMmASPK7wsxXCUM3BmbMcWnYf9nvi9Hrnc0=
X-Received: by 2002:a17:906:c44e:b0:8af:341c:1f82 with SMTP id
 ck14-20020a170906c44e00b008af341c1f82mr2595900ejb.4.1676144789870; Sat, 11
 Feb 2023 11:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-1-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-1-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 20:46:18 +0100
Message-ID: <CAFBinCBWkBWkTR6F2+zO5OGh1tmbwh8X8aTLTar=SqSEZ6iMAA@mail.gmail.com>
Subject: Re: [PATCH 1/8] arm64: dts: amlogic: meson-sm1-bananapi: correct
 usb-hub hog node name
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_114633_183700_73247567 
X-CRM114-Status: UNSURE (   6.76  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Yuntian Zhang <yt@radxa.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 7, 2023 at 4:08 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Fixes the following bindings check error:
> usb-hub: $nodename:0: 'usb-hub' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
