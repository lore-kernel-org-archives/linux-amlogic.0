Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52205C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jul 2022 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5vitEom5yPVHNDdc0DKI4lUG7UrMEZqK5QD46Q2L+U=; b=WU/ROH/Z3jKH35
	yy49svul6ewlYQDgZ5rC7VS2OSmDeZGoDlqipQlh3h2ZYxwldlHHyEuDHu6iMS78MlEFdS5iJ2QY3
	k7DcNaPpJKRAhGNzVmo8VfuOb1SgFhHSMikBaK2cTATNAXWvOGVaV17Z+xciZKBZX7QUrbnOiEkoL
	wL5TTXgL92/bpKmfOjOpIFDryGuphXGmwNNo98kGlXvShS8XDsKh3nX7Ce+DxAVUy1IJO/f1ehr8m
	QldZfbQQT1BEE5oz/6Ha19rkL05w/zWVXw0lElWf4O8Hu4vEznrznnrYZNwIAxKpUhxw+4mFeRr6Y
	FCQJQwHiZa8ZWtF4vhoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG3xb-000xpL-IM; Mon, 25 Jul 2022 19:41:47 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG3xP-000xV4-2v; Mon, 25 Jul 2022 19:41:36 +0000
Received: by mail-yb1-xb33.google.com with SMTP id f73so21914876yba.10;
        Mon, 25 Jul 2022 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SyXBgvw8a7RACZb2rtfcsCeOcLD/UgLIb3Y6mjqQA6E=;
        b=EzZuB8j7SIjJwSM5k4eg8OcGGEFloLSrKlbUR9iuFawW67W40cpq5q3t3HzDL0ud14
         go5BAnP8hJK3fZBT/qJXj9OMR9MjRu9lAFbdfCDfVokU/1ksRJ98wlReXsk7fLWhZuTd
         HAZiua5m6KopXWBqeX2hTr6/VElxoo0Bl8m/y78jJSCUf+jzP3v1ZAq9CdmDiWwtFHX0
         9uMGjYhzNqv+SgE/HNiWEIcitfOH7hj/M3MZluqJFDcDEZIrtCRcYx6bQ47cEq6NgRAP
         6Lok6AXfQzrqv2rr2BQp17+IuLt98NVcL5vilOtOTIjl2gS8blgEuLXGNV1DrAMJ2aNS
         EBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SyXBgvw8a7RACZb2rtfcsCeOcLD/UgLIb3Y6mjqQA6E=;
        b=z8pzfAvK6PxbNOGUVSRMy5tUEHGAXHc9FQ1LCq2e9dMOVtl9YB4ZN4/XmoZCOugSO4
         PzQRleFEtzm4xJsXcy9ShtyK/yU/WhjIv8z15eH1paJ09KxWdRwS1b018Dhnwf2YLRsM
         /gp5DuvpLI94uxJFFfkJ5ZVIQJjyPZEWqCy4hwR9iWQWPsLDFwFrQ2woInFYxoLgatta
         QJCIx5WNOqFMJ/82gEc0MXvcJC1FctUn0625Ff1hEl5zjDDj6EuEgHje+p4GeOA1430X
         fhi3TK7ta1iQ5PBpYd6x4ZTEY32eplIAoacEXEJ/M8mZOlpcYGw72Yztey/FFI7vMKMF
         5R8Q==
X-Gm-Message-State: AJIora/6Bgu1HbTg0/Enx8F1vbliHNZFdqCFY2DDIqWH5RM9EYuJRtG8
	af0G++KJ/fK6IJ1tLrk82/tP0YuXbxRExzDOXEI=
X-Google-Smtp-Source: AGRyM1sVMXFjNTqctjcZYh95IEJaDvFMBwZkvxODAvQX3LCXPZIq9zfpwZw2trNQYgU/O2Hi4wHhLYx6irc0/wmWmco=
X-Received: by 2002:a5b:d09:0:b0:670:85a4:aab3 with SMTP id
 y9-20020a5b0d09000000b0067085a4aab3mr9723774ybp.182.1658778091428; Mon, 25
 Jul 2022 12:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220705021526.281441-1-windhl@126.com>
In-Reply-To: <20220705021526.281441-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 25 Jul 2022 21:41:20 +0200
Message-ID: <CAFBinCDVX4pNHdEQSnypT6K-+FoO3_HsA0u4Qc6cR3hGHH7=3g@mail.gmail.com>
Subject: Re: [PATCH] phy: amlogic: phy-meson-axg-mipi-pcie-analog: Hold
 reference returned by of_get_parent()
To: Liang He <windhl@126.com>
Cc: kishon@ti.com, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_124135_165031_CF92B099 
X-CRM114-Status: UNSURE (   7.96  )
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

On Tue, Jul 5, 2022 at 4:15 AM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for reference balance.
>
> Fixes: 8eff8b4e22d9 ("phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI analog")
> Signed-off-by: Liang He <windhl@126.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
