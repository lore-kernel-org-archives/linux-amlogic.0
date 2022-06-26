Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327DC43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jun 2022 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VAAAgTEBt8xwwfylSmTENOKVLhYu0KfJmKrO/wc5Ss=; b=iCtbIhsv+vnCUa
	WEgLeoKdVoewa8s3sGIFmchB2DnbnP4d1wM7TAxR18KKiD/dAniCUSiUhx6S2tIUBg7eCtFg6h/q6
	t92CgBJn3eVe0Wx5gLPQd5msx7e9LuflPAomsqDJ29SRwoESMChdu/7pRJlE3i1KLQdQVCmeUi2SX
	Ke8T2MoqMNYSpcNAj7fk4Ru7w1rLbudJKhFKvegye6MRM/LBQR0zSvmTZZ3j7TvI6qqb1nP311dbG
	nHv5aGqq9SEGpLXAST8kUDzMLvokTkwI5uCO3oPTK+x+9zpTe+iDjU4L6jrpRXakYxSMe2ovfQW4D
	ngEhTzfcK4FP9E21EqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ap9-00DseS-0K; Sun, 26 Jun 2022 22:33:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ap6-00DscY-PG; Sun, 26 Jun 2022 22:33:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id cw10so15442915ejb.3;
        Sun, 26 Jun 2022 15:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O51AM3Qzm9rWVB6oLrltcYSc31aaLTopfeRLV80m1Yk=;
        b=gDLni17NhALEi/hNiPzVgFRh7cP8zgvivg+f5FfBrWXKmrg1ZfqlR/dpgGsuvU8xyA
         s2gLamxDUBAvE4VWjcmMmB6LdzW0OqpGmPC6HF54CN/3jMjGSzbnB8bjcgNAQc/kNn6F
         uCqte+fPbMKqCp1KcHL13Kcclk3RWtO+ua/WreTkTN8rE8KiD8eb+Oqxb+1oWpWQ3xhx
         IHvYoKz6GnK3Wg8Lbq3T3noIe+fwmQ/glEBh58trPhABAv7X8On2N2Jgvvh5FqZsnAyO
         o1SMsqUi0da/Z3AJjmJImlmNXX5SkTkmUldE9MKCLp0a4EfXklkri1+Xg5EoFXL8unoI
         SxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O51AM3Qzm9rWVB6oLrltcYSc31aaLTopfeRLV80m1Yk=;
        b=y1+NBrcCEQxtS9XBLIiiQ1ZGZ/Y9qVgApBezPZCybKjGQJLDmj7EcadgH1H2Uqnvc8
         zG00uJtLVR+eCjMGfVSWptMVnjw/NEE8UvzZBYyLbEjDo960UvzcTzEnVQbIt7uVf2de
         bmkXYq7G/1hLv5bhd8RuVNwzqorpfA6trvfZ/huSXxMqgfRBeXMHyaHZNhZYOKlWygpw
         0o5Vn70jeFlH9zBu4ObbV4Ycj3Ji2edGeLKJWz9cNtoJ8Q5HYoNww2zKkyvCChH15Yhv
         ou6mpaocdo/eWbfFFJbmpC1Q1OW98z2d7TAtPK2rp9OAcHkEWGOPspqUK5GOkBgbg63W
         9ncA==
X-Gm-Message-State: AJIora9RR1ZkHbiXqzfGO1/5kATJaY1CHo/SH45mhLN7XLw8eoE2u/te
	yvSfFZvX0PGFLfwvcFkdp0wq703xiWBBOd01AYM=
X-Google-Smtp-Source: AGRyM1uXR6Lm+Uqx2z3Aq3NI7bcB199Bsml3RGNzAeBEZ0KTVBjoaNUwUSrUDkKtwStl3kTYGYR3Bb5P7Was8WuQxGQ=
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id
 f17-20020a1709063f5100b0071239458c0dmr9736344ejj.302.1656282822640; Sun, 26
 Jun 2022 15:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220617072723.1742668-1-narmstrong@baylibre.com> <20220617072723.1742668-6-narmstrong@baylibre.com>
In-Reply-To: <20220617072723.1742668-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:33:31 +0200
Message-ID: <CAFBinCDJmjpix6Y4yN8PbNUvJddEhwFjiLJe+zBLo9vN2oNbng@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/meson: add DSI encoder
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jagan Teki <jagan@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_153344_858147_A554C13D 
X-CRM114-Status: UNSURE (   8.21  )
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

On Fri, Jun 17, 2022 at 9:27 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds an encoder bridge designed to drive a MIPI-DSI display
> by using the ENCL encoder through the internal MIPI DSI transceiver
> connected to the output of the ENCL pixel encoder.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
