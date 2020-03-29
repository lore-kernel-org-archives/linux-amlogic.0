Return-Path: <SRS0=Hgg4=5O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADD6C43331
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Mar 2020 10:35:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEED20675
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Mar 2020 10:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q58vfyAD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDMkANrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEED20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wlw8hAD7Ug2+mu1ETGXblGonO6Rcyu6EvuY3EFhXKS4=; b=Q58vfyADrGqY0pdZV/OBCQztx
	lRbtlDOdJ0MxwsFVhEEoSecwur22Ih7T5cVvV6ZLo7/76azglxojz/tF4NH1aoLzfKOzsmmkv1PU+
	zLVsBQD6GZ07IFve9znJp4c5RaeF9ZS0Bikn6S5B15AhR2sUKPfD76E8NZQLBcfhm4hDAbc2dVNnJ
	msyVwzD+qi8t0u9YGgUhCs7iw9zFH+VXhSwJ2jXqf7jS+P2yB370oK4O4NfNmiycY4B7q0ooeJ2Ct
	7rKv8Ssq26rp6jni/o1DVyP1c0Vth+4Lg4UX/6SqTAUtCfCMca/GJcHILh5nARYvT2XyYFiMZJzcp
	gAs9lcG2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIVHp-00012N-CL; Sun, 29 Mar 2020 10:35:25 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIVHa-0000sN-OJ; Sun, 29 Mar 2020 10:35:15 +0000
Received: by mail-lj1-x244.google.com with SMTP id p10so14501323ljn.1;
 Sun, 29 Mar 2020 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VZb1AfKfLRj9i2noeV282Qx0noCiipydqn+qVo/7/5Q=;
 b=nDMkANrF8lq0pvR1cZw6m71QuW1v/Qsxgva5CcrRtYJk2EdRpv23zGxomyVfvelanZ
 qGne3mDHTHhNLXrKWO0eFjqOnshQZBlgY4vM4pD8j2LvMt1BpYaqn6rAFPKqjao7rXsv
 dYrzqolHS6zxy8VKsb534noN/lrMMf2CdEWeNLbpmNG2GOXQOd5Pe+ZyA/qkEs3u/wOw
 pYd4r+jmI0W5CiZeyJJ143JlO5sDSNBKKWklcw5xzeB2whyYT/NNl7DxrhKvoNK26Rx/
 xQSLWCv7yR1hD0SrJ6H8QPawPf8nudVVVedtZFhp9KaF4vT8jwz47XI1IpWwyORH3nQr
 HTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=VZb1AfKfLRj9i2noeV282Qx0noCiipydqn+qVo/7/5Q=;
 b=rrdud3ZW5XkwExntJQ0lP3L3hKm/zksoV6UrpjkxwYPmgSosE6Kn5dg1Y/ivUgJpHX
 gC07eq5ERcEhkio1KZ8Js2koP3/VMgJJogJEgTAe6i3/3XiGqyLPoAxj8fFOnOrT7a0G
 6OU5NExY5WaKB5S1SgzKNSoR7xetq7zspsDEUh6fmho7R6OK6fjAsfvOCP3lfQQUNqr1
 /F8pY8GoW6VFkxMlqw2Y//5PO2ekWD4YkDOrl9MwUqKTXCRjYA272CBkXk2C+NbHik76
 ZcgJZsq4a3JX1eyVuspDFC4g4G87Wixl2doHYGtMJD3hMouLe8nLDQbD7m+AYccmokWT
 GHxw==
X-Gm-Message-State: AGi0PuZNQHQbC55ZfvOJslG1iyRABiHFWTMEktCH9Sn8YRiaGZrTaqpT
 6Y5wNdr/vgUIiWZjyvnMMPezHs7jpN/AEA==
X-Google-Smtp-Source: APiQypKBx3zbW5qwWIsqD9EM1rU4FvVNPAUSElOJ5CRSofQwV9r0M7sICdD307OhFZzVsNJNPXTzlA==
X-Received: by 2002:a2e:9586:: with SMTP id w6mr4373232ljh.133.1585478109014; 
 Sun, 29 Mar 2020 03:35:09 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id z1sm1514968lfe.49.2020.03.29.03.35.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Mar 2020 03:35:08 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 06/14] usb: dwc3: meson-g12a: refactor usb2 phy init
In-Reply-To: <CAFBinCCVTP+MrLq1O0m1pcvLo6WSXyXpTtWMEQQxOuraN+yA0w@mail.gmail.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-7-narmstrong@baylibre.com>
 <CAFBinCCVTP+MrLq1O0m1pcvLo6WSXyXpTtWMEQQxOuraN+yA0w@mail.gmail.com>
Date: Sun, 29 Mar 2020 13:35:04 +0300
Message-ID: <87zhbze9ev.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_033510_795492_5E23AACE 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8039185691740860544=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============8039185691740860544==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Neil,
>
> On Thu, Mar 26, 2020 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> =
wrote:
>>
>> Refactor the USB2 PHY init code patch to handle the Amlogic GXL/GXM
>> not having the PHY mode control registers in the Glue but in the PHY
>> registers.
>>
>> The Amlogic GXL/GXM will call phy_set_mode() instead of programming the
>> PHY mode control registers, thus add two new callbacks to the SoC match
>> data.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> checkpatch reports that five lines need to be checked.
> these all look valid (for example: "Alignment should match open parenthes=
is")
>
> with these addressed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

That's a CHECK, only shows with --strict. drivers/usb/ ignores those for
the most part.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6AedgACgkQzL64meEa
mQbodA//VwUAbPvOPF986Bz7VX5RkvL58wf09qnwm0ENuJKT1UA8iwdt+72lvoa9
Nbj1TYTd3d4wT3Hd5MDRgPGb3HaOKUQ6ouQr6mSnWD9Qq2NbODKighWGl3UDYwCx
6cbe9lllE6yoenGtJ9R4VUMa+UnlHetdg14ukiEMLFipgcmPALUkaghD38aZ0Fxo
/ARman65bgvoKBpJtD4KBzggm1Y93e3ckojM8FKiVFTrixq28hiZC2PqCLRnJ5SG
GfB9YSxJ5ONvrWeb8ReBd4LGCZvXOmniJtDbUGC7OAuAt6Aced5aGwT/xyQDJyCc
fGveU2syqx16Eb7kiIQ2ViQUZidpl78fQo0FNXz+vDRfg9s2cRKafgpnYEV+BG8G
WNiKVdLmB9tu+oRlSy2om0uxU3JcvpoVrWwIYivvppu7j+xgQM0ryzIgAMZ6Dz1z
H9F/7ttjyn0VbrkvIpzcRdS9Vkp+JYOch0zP/Ym7IePXD2N5WVsoWLECAgpnFitJ
cQvn3BX7zgJ+ZNTrMFkNqzuzUczAKXfKYMyfhfFtmG7IPvgmheABnLihkTQ4ezOQ
+zi58Uzewg6i+JYTNN2Myg9GaR34PoXT4/9iisjqvEv0hzF8Y8zpw07nqV3X7G6T
u0EP1/sS82rRixzko/l5L1JKJCspyUwdyyq7NZNHQ8usUhNrAa8=
=MQ9G
-----END PGP SIGNATURE-----
--=-=-=--


--===============8039185691740860544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8039185691740860544==--

