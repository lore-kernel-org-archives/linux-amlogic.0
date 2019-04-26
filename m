Return-Path: <SRS0=lPQy=S4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201E3C43219
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 15:26:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57CA2077B
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 15:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/GkEfTA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM9bxojQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57CA2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MlVF18Ts6wVU6RzcW55m9GfNaKcml9Cv1NFyw4LTubo=; b=k/GkEfTA2a6b1SbZKwn6bD/si
	kZ00B/t9vnE1ubzcEntx9Qi0hwS0lzp1R20l+z5drkXa6LBnGmST9bE4NCsv6Bp6Xj0kNsaFu/jIN
	k/OnMKKfPp6Z9wYL4pYuDDr/VBT79v6QeZ/efHWqf03SUbvw8OZF09TEr9HHzgf8swjTpl+i+YUPm
	9C+inoPdk+Q20otXutM/6B9Uwya3dewxuHK/X1YO4l15soIhR1/YfISt7BkN16Pe8VfgaOtkAkGDn
	+I9a6Ursp2EQ7+aU5Kd6JsRtkrKU4d9/wX0qvBwz2vTm8fxDeYSvuJ9qXOQO1Ome8+/RYkmeojGFF
	17u7BE5Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK2kF-0001S1-59; Fri, 26 Apr 2019 15:26:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK2k9-0001JM-Uc
 for linux-amlogic@lists.infradead.org; Fri, 26 Apr 2019 15:26:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id v16so2586218wrp.1
 for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2019 08:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V0SNaA0nEp4NEznqEA+NA6qfRftkgT/+RnqJg67XDDQ=;
 b=SM9bxojQPSBmqQQVSvsDOVle93PrvwJWmY4OxPN0mmUlOeSEjlstv5HsJ/Mhfbfzi9
 BAXwlfgNkGFEfxFA8eLa85qp7SSoLOBy5b7vLeQG0lVHEnkB8TtQGM93dGfhKvhmqV5x
 XK/+zxLnqPQ9731mtAzaeu7eNCshXQNLTbeRQju+1+H1/O57JeOW59Hbmzm2/JTM5l5R
 1kxLx/4s/4Y7xsXlKEJibGCgW/Z+QzJ36LlPSkpfU8hW8PjnTvH7bYzixBw1Hp95acdn
 vJ9CdmI+mftwh7QfSq17I97Z1lAQKP5zfyYa09nYW109dDp5SNbppj43GNVczH3X4yzD
 dhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V0SNaA0nEp4NEznqEA+NA6qfRftkgT/+RnqJg67XDDQ=;
 b=oboASZuUY57jetD87IC222PGYl9mFau9vyA0PRKE9abXC+YvA/OBv2vdi9hmYZAb7A
 OwR/Ews5O7IcszZIhWndt/kaBsIwbrKUy8LEdBgWHUwjmucLV5qz+IGNl38k+jFZ51hx
 Bi3RnVF207m/K8dizRjwtjFlnAdLL3ENFkueZVxefJGZHGNRQfepAVmUeUQJiUJn7AK0
 nsFxiSoIQAr3jPv4HF1Mfnv9xcUcgffTMbhaKpSYpDfjfb4jgNLaZZP9k5t5aeUG2j4G
 s9St6koYBkAY5IxYkB7be51prEh6+7RQ8nlmUWIr5YfxhrzxHCuE//mroUKgSXNSYROn
 LAYQ==
X-Gm-Message-State: APjAAAXw7d6biD4LxXfqkWmRbeoGTjK88eF6BIvC0s51dB5r05Lb8OWA
 jlyQ75WXDRhSblJu1K+qaW0=
X-Google-Smtp-Source: APXvYqw7/anK5JnbqxGLUMsdL+B4zuaiJmr3tkm7vHqYBTqwds5dMyl1TXGtrq2erWcBisYe2qwuSw==
X-Received: by 2002:adf:dc4a:: with SMTP id m10mr29861095wrj.0.1556292388228; 
 Fri, 26 Apr 2019 08:26:28 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id y197sm25921452wmd.34.2019.04.26.08.26.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 08:26:27 -0700 (PDT)
Date: Fri, 26 Apr 2019 17:26:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Remove CLK_IS_BASIC clk flag
Message-ID: <20190426152626.GD19559@ulmo>
References: <20190425181447.60726-1-sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190425181447.60726-1-sboyd@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_082630_319546_9A11C72D 
X-CRM114-Status: UNSURE (   6.39  )
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
Cc: linux-pwm@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Paul Burton <paul.burton@mips.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============3455416204443353871=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3455416204443353871==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 25, 2019 at 11:14:47AM -0700, Stephen Boyd wrote:
[...]
> base-commit: 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b
> prerequisite-patch-id: 6196ca807a15f9f4a67d5e6b8668b4f13442ac15
> prerequisite-patch-id: 9532946d1be40c2b20af0591ac4636a4cf3b14dd
> prerequisite-patch-id: 4e4a9591f5a4ac0d5a72e694da8fdae8c8dda352
> prerequisite-patch-id: bcd75306e64ff866989a978127f6b16f7575d0d3

Just curious: what are these? I mean, I have a pretty good guess what
these are, but how do you use them?

Thierry

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzDIyEACgkQ3SOs138+
s6E+3w//QY2u+1dP4U77H2Ps8hLK4fFnok0GiK/ZyE+yaditfEYdCZqS/hh1xG74
OEKrMRaCAl1A8DyAJJzro7Iqnxgs1N81PPGVzvl5je2hNiN2ODnhtk+mmFuuUBf3
QwBxhXzVDiCGtrlkBtpnMlRymurRvS+SIuDK6fyzArGjgbaVXREozJ06Q3aytemZ
gMfT3AZ5laijFVEfd6vtKrK8hJkMHTHDzpN/uDZ5hlZFEoWstRqluQR404vxZr3h
3rq0Oq5ECOt9go4+ZHnXfO0QwubsRVpuF1O+8U9L8WQsWUKKppmrB0veuvTNoq9W
m70l8deU/Tn4j7VXu5pyJbREZj7UC2flPgTgPrhonsUSTQo+s28pehxWk0I8jGVp
xc5Z2Ie+uoKt+SBIchug6Q2TX3jLDyynplLJGcHDsfI0HsB21mW507fGI1odzUTM
4Nglwx8c+LjynVJGKZI/NbXMOEkMQLUitsrM/tOyyQi0ew4144Hc7i3PVOpX60zE
dy7mmJEJ+80zaPXqjw5meMFq4v476Z8icKSZbHyUJaSrPdr/8f22s73ocQAhF4re
/kb+odtUNfV4+V4BN2RX3W4d8jqux9Hwnr2fGfcuRt8VnO7F8t6LUcswka9Umt0k
h91yTD/BQGste7Fa/Q4Y/4ZZMidnTVnzoLa+sqZaBnX4BUOIz6U=
=ghXI
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--


--===============3455416204443353871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3455416204443353871==--

