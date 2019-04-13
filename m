Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D5DC10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 12:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB5E2171F
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 12:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldPWUNNe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ELSXzfTz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DB5E2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WwiQSuu3vhoOl44wqXo5c7OeEApTfl5i2XtOLuTNmg=; b=ldPWUNNe0Nsxrj
	SuvgIPiMo3T91AkUqjfxq9KIaLtkx5JFrf3Is88FRgyGq57YWG1GVerBoq6pW8G4AV6DQj9h/2vW8
	zmXJoBf9mhl3u7ZzssOZZ0ohRC8nODZvH+taJH6zDQhj0s6nI7BVr1eYGEK9joalcNgYGfCzMkSqO
	C9MymkN/IoWv3BZPjyW08LdEV+96NeMFCnxsFpOGoOm8NODFBhcPtSu8e9SvfkoMQuRA80aYZ7uo+
	ktcGYOWmfb4hFeMl3pR+0GA3w0fFQ5y/EVMwnDK7RYX7AbXjT3hhqWFojTv/JtBHVWR+/AJP3atl3
	c9/8IQ2T5RlEaGk1Lcrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFHN7-0000n8-5B; Sat, 13 Apr 2019 12:03:01 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFHN4-0000mj-E0; Sat, 13 Apr 2019 12:02:59 +0000
Received: by mail-ot1-x343.google.com with SMTP id j10so10710207otq.0;
 Sat, 13 Apr 2019 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlEZGPTlnZZP+TvIWHbuXPtYetCJzqo7TQchFqePyHY=;
 b=ELSXzfTzoZtMaOBJpC5LYogij7n92yZHgTZh5BQ2szD4EXWNez/WxAiRVEFApHdZwS
 J4LzOyS/BWinnBNSdlH01q8Bcw/Yxlm+TrUuzN5QuCybrZtliKQt1MJROHFVqSNYKeJ6
 cNst8OFbOP1b7MDFE02V78KIzU1zcgvG10nPbE8GCGgbDv9VBJLbcDOwfFkAXGp7gag4
 bWhqGi+BqcUIGQgdpQ4gu2YdTFPKiGsK7/fMljmZQA6bO73SyNKjUOQmutxJjhs/pGI4
 +8+Cmdv4ofvZb/zqrwv7pU+TCYF7WN1ehjHKVxGV1/u+ufckrxswbb16NUcZBwaJPwCL
 2rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlEZGPTlnZZP+TvIWHbuXPtYetCJzqo7TQchFqePyHY=;
 b=BUo2EB3eoX1BxIZ5Xgz1hmde8hT/Fp544+OCZnxUKP0mUfJR1Lp5SOEnSrpcTae9o9
 dx1+sDZY0hSO2vEphkMlTYtGBcCxsFfzAzweaKLOeiQLgv1LM4fCfe68Q9vGIgt0IAh6
 ugYgwhmh+6+byBidASSgYdulpLShejfV/iqpyjUwQ1pXaF/TcOQsv6ofIx/TO99QQXzH
 M7gy0vUEuQLhdI+XedUOpCcz4iUcV94BTwpbqel5r9uZANdqqD8/Jse7dSzn8o7pdgsr
 Fj9Br/IMo0m6EI343b2OPs4cJ2QNnNJN/ncmYinTu2d8M1wUkLDzMJYQsyrhhSxkiPvu
 Xmdw==
X-Gm-Message-State: APjAAAUiUUhOOf5hFiyb8VqMv9o4qDx7ofNXQCjQA2QIeXERD4eWGSAH
 jXfSNQ4OxuBTJxU6Aeg1xV11JRMnwjEZZfgvHfk3Sx2w
X-Google-Smtp-Source: APXvYqwXnp6BZLhLO1NTKKwb/qMP0AD3mnlOPjJrnhWiMUUU+p51m67YaGsdfmFaOUB6so3SI7PZ9ilYBC32YYg6uWc=
X-Received: by 2002:a9d:6e88:: with SMTP id a8mr4282525otr.117.1555156976586; 
 Sat, 13 Apr 2019 05:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190412100518.24470-1-narmstrong@baylibre.com>
 <20190412100518.24470-3-narmstrong@baylibre.com>
In-Reply-To: <20190412100518.24470-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 14:02:45 +0200
Message-ID: <CAFBinCB_V_JR=+6d40XMYAEP9UPopeB=SGZWzDb-B_G_JXRfDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: meson-g12a-x96-max: enable IR decoder
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_050258_465224_6EC5AB16 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: baylibre-upstreaming@groups.io, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 12:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add support for the IR decoder input on the X96 Max board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
