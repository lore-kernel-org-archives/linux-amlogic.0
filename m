Return-Path: <SRS0=83F9=64=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E90C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2020 10:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9957206A5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2020 10:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2TVlAON";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWwJnh34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9957206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jgoyUP9jKXMuDwjpvF6KFH2wMjkTAy7+iXrTbU4Y8Pw=; b=C2TVlAONRaCl3Ron+/B8nsHW2
	IMEHy9dbQKn6f9mhkC2lkOB1/3rfko2WJp1K4Nph6ATj/K6NYqB4Dg51w3Y3GEvstQBJWv6i5IXIq
	WnK1ohIgFsOcwn+HxHut8SoiQBQd8n9hcOxiXlOqSJAFRzi8fhCEvDvDyTeMJpk68j4gbFkxuMV/M
	nz0rzKahq6DpygTSY054nMO70vLdvPbbhatPe2/pZ+4C1eFkwEaulO1zq3Q8VDnqEStxU7IYjPZ6j
	rH+vopy2gw71hoJm/e2YfTu4xKVi8jsWtJ/JzqOiL8/ADRYYb3EMhiP4MInPGRvXDZ2+iUSFL6eIF
	hkcbDzxBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZB1S-0004bJ-R5; Thu, 14 May 2020 10:23:26 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZB1J-0004RY-1x; Thu, 14 May 2020 10:23:18 +0000
Received: by mail-lf1-x142.google.com with SMTP id b26so2158450lfa.5;
 Thu, 14 May 2020 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=on2D6elu53pZj4wNtYf7fZ0iGgEMC4vnCrij0e0GY3Y=;
 b=YWwJnh346DomNcO4odW5tj0MMLVzr9cRxcJo6n+Dt9fuMb4qneEfKEKUJHDnEy4yuN
 9cqWkmlSN93BhIYrTXcpa3kA/EtXoX8ZUxllaYJG2VuYBBbRA9Sab18ErkYrm5p02GXG
 KuTLvxrKQOAgsQJ7k3ip3Zz2n2cK/aCqUjj+FRR97mP/BhNETq1YUnciIbbHPU2Fclq6
 P0OJUdtkQMtwoWuV6zDzf6VUTxJlUEXBEwVROI/mQj5BQxuhH/dBkw/PrXszJn+a9ize
 l0mbAGcNZXhgwGywmoULZ8LhWBH+iz0dxAP2/gXPR4N43j6OYq0flMpdSl4iyCvLetSb
 wf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=on2D6elu53pZj4wNtYf7fZ0iGgEMC4vnCrij0e0GY3Y=;
 b=no7MbcjMLxz0oI9xTt08A/8u3MNGJbZOEnoAdiOR22jJLAHpBnzrcKHqoBP7scWLkJ
 PMeUrlm1In/NbBmpYNQTq2c9KvlnaxSufR4tq7eAYBHqsvPyXN+6Sqt8QvTtfLQmx909
 WN2wxEQHI+lUADAxPuFYkAULdeYaB8EanVtU/ym57NKshAeeUavtl+ZsU6elOT+8YF4m
 SmrQ5C0ZNIDzMZQmI2ZbFwEU9CgVJbTs6J3bplNdB6J5BtT2jU2annsyZlZ35xdGRBCc
 9igPSXxJXidQSJuv6MhLy+SbYxkVxn43pi8i9sgBaCWdplgl3hfGP6Rn31Yu7ocwnsyE
 F9Vg==
X-Gm-Message-State: AOAM532c7YPg6+3sYGo8zpXG+m84nt5Z+AWXzu5m09hs26Y1dpVTSh03
 0czHKa4qGVZ0O1FUWd+e/80=
X-Google-Smtp-Source: ABdhPJz0OX6tX5Djvgz/x/V2SQPdQDpdcaDSPFTtdAjVwURPzcOQ1sZlYNWA8qY/i2cUpwYwILXpBg==
X-Received: by 2002:a19:e041:: with SMTP id g1mr2742299lfj.70.1589451795238;
 Thu, 14 May 2020 03:23:15 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id k9sm1231222lja.52.2020.05.14.03.23.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 May 2020 03:23:14 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 00/13] usb: dwc3: meson: add OTG support for GXL/GXM
In-Reply-To: <87369rfo7l.fsf@kernel.org>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <87369rfo7l.fsf@kernel.org>
Date: Thu, 14 May 2020 13:23:09 +0300
Message-ID: <87r1vm4xyq.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_032317_091939_46DD96D4 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: multipart/mixed; boundary="===============6413705557226618973=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============6413705557226618973==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Felipe Balbi <balbi@kernel.org> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> The USB support was initialy done with a set of PHYs and dwc3-of-simple
>> because the architecture of the USB complex was not understood correctly
>> at the time (and proper documentation was missing...).
>>
>> But with the G12A family, the USB complex was correctly understood and
>> implemented correctly.
>> But seems the G12A architecture was derived for the GXL USB architecture,
>> with minor differences and looks we can share most of the USB DWC3 glue
>> driver.
>>
>> This patchset refactors and adds callbacks to handle the architecture
>> difference while keeping the main code shared.
>>
>> The main difference is that on GXL/GXM the USB2 PHY control registers
>> are mixed with the PHY registers (we already handle correctly), and
>> the GLUE registers are allmost (99%) the same as G12A.
>>
>> But, the GXL/GXM HW is buggy, here are the quirks :
>> - for the DWC2 controller to reset correctly, the GLUE mux must be switc=
hed
>>   to peripheral when the DWC2 controlle probes. For now it's handled by =
simply
>>   switching to device when probing the subnodes, but it may be not enough
>> - when manually switching from Host to Device when the USB port is not
>>   populated (should not happen with proper Micro-USB/USB-C OTG switch), =
it
>>   makes the DWC3 to crash. The only way to avoid that is to use the Host
>>   Disconnect bit to disconnect the DWC3 controller from the port, but we=
 can't
>>   recover the Host functionnality unless resetting the DWC3 controller.
>>   This bit is set when only manual switch is done, and a warning is prin=
ted
>>   on manual switching.
>>
>> The patches 1-8 should be applied first, then either waiting the next re=
lease
>> or if the usb maintainer can provide us a stable tag, we can use it to m=
erge
>> the DT and bindings.
>
> it's unclear to me if this series is ready to be merged. Can someone
> confirm? If it is, can you resend with all reviewed by tags in place?

Are we getting a v2 for this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69HA4ACgkQzL64meEa
mQY4DhAAtHTcNLDu5ri1XuAeABlYEcezvODzuPM7Xg0my7l1TAURKXzAe0LV/LSB
9FU5hFcfAPUD7JSDmyGey9foVoFKo0ZxOvXLTXCW7AFHq5UyphcWAa5dW7kjtrI7
uqJ9VYc6gdQ6a/lEJXTdEuq8lLBt88hJkU8OPjzedp82in9fGXZg0mmwDePj3yVE
6KAnwJG+9qKZ/t06kNY2POoQpyFGnjOruj+9K4kG1R/RXGrU1YV1Cq6+GZp/DNoj
Z81nw30hMBIFmKrxMl9bx+/hXAQUPV0C01txbCkdCGVTtp/L7GB3RXWgEljIyPPw
KiE2yF12BFeuOB2egjAIWVztPxlzh0W19f/2bAQPEhlHrfcu83SJDAdEfMx/pe+w
aFVJhdTZz+GeJ7K1Oame/ddtzbuPTyUbZFo4c0qASictw1dXGir88hOBeRrzpjJ0
d7cmNieizTfV8EoF0/FKN1NuwIie/k/dZiejZ28lukE8pZ2RUXxuBrrncmHk+Hrp
iHTOjXsXTYJgVU4OxXFk9Q+B0YYgvpiAtrAS3Hpn3UQMX+KYd1RMELFSYtBLUGCG
TZ9WJPGijn2G7rmvDy0sJtxhLsRoE9tx7tvr6HG5btz2fMdZmTnK6cW1nyIoP8kP
ijmeyb1OUfQTkFoBIZUIPi5pTkuuqScPtsu7LAF+nP7HjD/+VYk=
=8p6e
-----END PGP SIGNATURE-----
--=-=-=--


--===============6413705557226618973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6413705557226618973==--

