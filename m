Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2236EC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:14:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72AE20828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vD/1VhVp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sRlEqDEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E72AE20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufUhE4BrrxQ19mZA+yRQc2xzHWLSZh86ePkCYbSt+p0=; b=vD/1VhVppYd/PE
	Bc7RXkaJ8uTb3RfHchO10+fv+kjX+5gSa+mSStLDzzqEPnLulytka5+d2nY6UtjHnfUfJouKB32ts
	Wcw9+lCMVh42sQLGFENqiSdMt4rrOj34kurDVuuKNHunqELkE+kf+1SeuNppkhzXn0wG7RjrkZNIA
	lXajFoZweQli+moiNwZCFWyzD9Xh0kss14PKAKl7MU8R+0gm7SV5BWmRvIg4zz0QC4+VLcRwZ0sdM
	Lh3scmcY41GzowRQ5osZcVbpGdfeWh64JCwvdfc5Pg/KaE88cZ52eRbwbvQPPYzaQ7QGFncfkN/4C
	3WCw2bUZpVSbXJxZScAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ye6-0004Ay-B3; Mon, 18 Mar 2019 20:14:06 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ye1-000444-PY; Mon, 18 Mar 2019 20:14:04 +0000
Received: by mail-ot1-x343.google.com with SMTP id x8so15612822otg.7;
 Mon, 18 Mar 2019 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sCaVs6o3RVpxDMzAy4B4Wg4rQyGWz3EtKJvXXlUnELM=;
 b=sRlEqDEnddOSXulQi2zIzuiXXowkkmjCs73LvIheiz7tLe5bOygwhS1y8OwRWLWn/3
 aV9MD6h/MI5dElzC5AVyhEyPmOLIPkrxF2jIoJwJBzxhGGiBh1WcTSCh0VLnSyplRDJU
 vXxhbOIov6z9SsJOnJBF1o7J2XaoUV+t8XoisNOOmHfwCa0ildR3AOzdbNRYgqX3lI00
 AEUxQrMy5X11Ag0akcYsWSmpkQ/d5bnCzxsQpZ2W+KhMLCM8E9vlrXnzKclOwENHUrVC
 Ecn5kbajwGuK7H1b8SUkfQGvz90roEUUI/LndVzcPS1jaUgAPRq4P6gqYKHgHMonroKs
 Zkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCaVs6o3RVpxDMzAy4B4Wg4rQyGWz3EtKJvXXlUnELM=;
 b=prpK8rbY0RD2D3BL4JIetuHqT8S0TbzJl3wgjM2xOiSdtUVnXmGD9E/MoaiOyAwzc7
 ms1PErJ0YlVDLfrkPcfEcsPkJmideZ+UWoUdky/mMefGkka1OkKji5ESUPxa63cKAlRd
 Z9nR67SD3S//LC12pnILLlLjWrJTCReeeKljX0EQQ0RY9x2ryHkUV8HIF0/tm8Bm4DPp
 bP/U0MMXZKlqJ4tWbt52DXF1C3jg7u2geFTcca6jIjdkdDthuyFuY9DIVtWMeTezcQzq
 i9GZtQKFw8s9wnEtaWcbtqU9DZzn/Rb5EJAXSXInXFb5qk1GuF81LUehjL8712g4bd5K
 gLWQ==
X-Gm-Message-State: APjAAAXbJ3Z4IkKFKchJnPexUTqEtxpLdtDr+OeLUznrOr/W+LuERsfy
 fGqQpZkO5InW9rgw7gsLmYz4H3Gm6a6/iNQF1Yg=
X-Google-Smtp-Source: APXvYqxwLPzvdW6+al7blZTxDDmQzklARpXfix4SUwy6Ucxd/tq4ChtYDInpoe+XNcj0qOBXbYEzLvsFW4l6L8QgdUQ=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr11332286otk.86.1552940040997; 
 Mon, 18 Mar 2019 13:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-10-narmstrong@baylibre.com>
In-Reply-To: <20190318100458.5619-10-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 21:13:50 +0100
Message-ID: <CAFBinCBWSoPoJ6F1fWdzE9Ogr+udamPYCYb=JUhuUb1hXf_yOA@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] arm64: dts: meson-g12a-sei510: Enable USB
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_131402_334679_B2CDA0DD 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 11:07 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable the USB2 and USB3 Host ports on the SEI520 Set-Top-Box.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
