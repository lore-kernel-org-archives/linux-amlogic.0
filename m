Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544B0C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/3klZENgeGGBxL4kd2iUsARLOpTUwP35fXVN9Dax9g=; b=QamZEYd5gYemu2
	QZzHdKGpUdGpTK8BkYykfN0cQgKJZLNEzCIQ+GcJIomJOeuwXNENm8FqaOi0hszhmXj2OqOwvPQMN
	oIvR8f7xG2z3KTMsq10YPLobZsebUAzyk4XTxrpRNK7OkleYQitXN9noOQ/kwBLNtF+f5aZ9/M1h2
	NrFBBAVUagLL2rhs1aDPs50nRe2/fGmCYKXPMI5yMqMF4k73QOJ+NNc4jLbXvWQHhKdky7B+OXCfo
	0kPti3iAX14wq80V4f3TVJ1YBKvZee+q91yxILJJMLlORYWq0guaExFoB4+RW52H/Py7nTk0Oih+M
	CVVUwIeSr9lUnPaJ6sYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLNC-005oWz-Ax; Mon, 06 Dec 2021 21:18:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLJb-005mnp-LB
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 21:14:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id y12so48121472eda.12
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 13:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brgm68BI0DE89Z05ISYE3IUoupNsIG1KMGEftjunI5o=;
 b=aV6y6k24rPw2CJyVM1o2JfsXWGgZNphya9sXdvmgdCHNWEevze2tiXZabbmGi8EIfL
 CTj7dWW7dXh1T9r9yt0N2nIzTEeOBdXYuxtFxoBO8IGj8Ne/Fv64vvWoJy+WItxQKBDQ
 1QT7uJku3XgFjyajlmu6wv6sa2zp5MRNYmEaXUat+KNJoIQlg5Kjz9v6pWYHzlHwE/O1
 mLt3CLkbWWIymOT6iwGGGOb/IFRJBuAGw6crKkGOUr7mTv20KsZFbleEyvxK0GRQUhou
 NvgSkGIXzlw85fmLah+tvtY9VBEFDmcH4WluTGbq1DJw9rEGli5FmadB1yRdbsxo9AXT
 ggFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brgm68BI0DE89Z05ISYE3IUoupNsIG1KMGEftjunI5o=;
 b=8HMypPtgcsCTe1OdPToC8RNV6DAX5UiIoaO6oN9/P6adyt4Px2g7FxucqoNdbi7Ql6
 d0lYwEqQonR8iftS2Tnt7wPQM9a/G6l8jKg9BkEslRsZUw+FRMcCfpIHsC5LfGcTRSI6
 /XtIJZ9YyZWGqcdzwRNXi80DhXhJ3cE42Tk8eFuFlL/PSOi29ce0Jw+nYMBbY/m+0une
 ZmQp065HbvnI/lyk3//xW5OC8NSLRO9OYyeVYk3DbPs0aETJhz4+GbSk1vlYLhurD+oK
 bHDItgynL9rVRCDz5MddtRqAbgYnowk8lQ8tnOQnflRrOfcjZJKEm2dbSn8icqI8OAAc
 d5xw==
X-Gm-Message-State: AOAM530hKsk+ZhG7WicbrIpxK5IUAW3KsRO5TfoOBXfJsrVklrlaBodW
 5EPwAW+tEmvS/oowY6TdJUGHmQkz5iaVsh/kaVU=
X-Google-Smtp-Source: ABdhPJw5ibITs718vIr4C+hbrk32Vh1GdlEtCitlT3VL4LyBdRiQQ9tky/A86/h687vsKKgHTtL1oP0JoIiBigaPrLI=
X-Received: by 2002:aa7:d997:: with SMTP id u23mr2455547eds.164.1638825266106; 
 Mon, 06 Dec 2021 13:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20211205215846.153703-1-aouledameur@baylibre.com>
 <20211205215846.153703-4-aouledameur@baylibre.com>
In-Reply-To: <20211205215846.153703-4-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:14:15 +0100
Message-ID: <CAFBinCAtuo46FGFoa=pObfuvTq0u7PXJhUpfHd34CCis7T1HQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] phy: amlogic: meson8b-usb2: fix shared reset
 control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_131427_742188_B7D6BE5D 
X-CRM114-Status: UNSURE (   9.41  )
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

On Sun, Dec 5, 2021 at 10:59 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use reset_control_rearm() call if an error occurs in case
> phy_meson8b_usb2_power_on() fails after reset() has been called, or in
> case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
> used and the reset line may be triggered again by other devices.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework, use of reset_control_reset() on shared reset line should
> be balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
