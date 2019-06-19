Return-Path: <SRS0=5M87=US=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A384C43613
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2019 20:19:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03EB214AF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2019 20:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/av0Vp3";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="RI+cDzFX";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="RI+cDzFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03EB214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:Message-ID:To:Subject:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jfS4vvRH/2Da2wiQP+h1U4Z4xauZYjWrMYyp94dvi9o=; b=h/a
	v0Vp35wbwN0tJqLtP8kCyCMfxkrxcPTjEPsImIg1Qd9ehHI/GnuGBKIwW4iGGssMGzdZr2bsQ9vpJ
	TqhY7osgsEGCsdeooqAuDxeo0FZpQD2uaiSiygnFt5BfjaeKqaYgf4OdsvJGXi1IPke+edAzIx2/D
	rjY4LJnX6wMh9+KZ3jiUH8HcoomW/pXSLjXLd1wxrIXXeNZj5DPkkYjtN4jX+WggH2h7+gid5jSwx
	az7MQpY/ez3HGFgebAWRwIam9YhvTI+pjFTJRtt/4PEVxJbSXv13MLzCSIJsEReSeSBJD6BSi2S1I
	7b+19IXzcN/SDUywcklFq0A4sYmMzZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdh2v-0002JO-90; Wed, 19 Jun 2019 20:19:05 +0000
Received: from eva.aplu.fr ([2a03:7220:8081:2900::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdh2r-0002E7-G4
 for linux-amlogic@lists.infradead.org; Wed, 19 Jun 2019 20:19:04 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id 72EE9E23;
 Wed, 19 Jun 2019 22:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560975538; bh=dgkwNt81oJL2SNqVdBcgyDSZV6O4KVyy0HOn1GzZTls=;
 h=From:Subject:To:Cc:Date:From;
 b=RI+cDzFXx+EQx2zlzlYRS3WWlCjx29S0LCtE3q4F/Ch4H8uXu3EWTtd/v0RKa56TB
 ZE6D+LG9QmWvOKIgxJglBczYslt5bkoZUSsBXjdFtQlcrkBD7SkGZarGjJy94B3zLx
 JuNxjRhl9ABmQOdhFKjX0oGHhSstA+q+J93OALHLIp1spKjditrHbU8KqUyyryuzib
 naGC9cBSoJsgkkqC/weFYXiXrdzEeWVCOq2VfVWD7iviWm8HWUhgapG8+omIBoEI/K
 87nqWNp8i/29d2aMtztdJrmoBH/+ikLewVCYQqOPtkS12DPluTKotU735K1Ux0/XJY
 +ELg446fYuOwPih5qp0kSXanYkT3V9uKjtqAcwOV//knp/8RGOmmxlk2oZOcaFQlWW
 2Yw3OQSy4TM7bXkxSks6U217qIffzkU2wCzhn1QO+2k2OJOQrAO839ZuvIYbbIT6DS
 VK+8SFCM2GYzg5o8jQx6nCH2gmpBkL93aTGa9opC/iHYLaEa/dtsNFoY+vkVL5k64R
 hjPMTIuj5kqUzwWrsGWao5LFR0919mb88v1PlDu1CAP/ItKSwYs1KBqECsiF0J+l2K
 ycHDPUMoPSzS4h7h/qr1u6qq/VjOLiJrLYT4mnGVzeIoHj8HSwaclSI4W6By7a4vH8
 dcyz5aFuf+wTBiemSup/FF9E=
Received: from [IPv6:2a03:7220:8081:2901::1003] (unknown
 [IPv6:2a03:7220:8081:2901::1003])
 by eva.aplu.fr (Postfix) with ESMTPSA id 201E1CF0;
 Wed, 19 Jun 2019 22:18:58 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560975538; bh=dgkwNt81oJL2SNqVdBcgyDSZV6O4KVyy0HOn1GzZTls=;
 h=From:Subject:To:Cc:Date:From;
 b=RI+cDzFXx+EQx2zlzlYRS3WWlCjx29S0LCtE3q4F/Ch4H8uXu3EWTtd/v0RKa56TB
 ZE6D+LG9QmWvOKIgxJglBczYslt5bkoZUSsBXjdFtQlcrkBD7SkGZarGjJy94B3zLx
 JuNxjRhl9ABmQOdhFKjX0oGHhSstA+q+J93OALHLIp1spKjditrHbU8KqUyyryuzib
 naGC9cBSoJsgkkqC/weFYXiXrdzEeWVCOq2VfVWD7iviWm8HWUhgapG8+omIBoEI/K
 87nqWNp8i/29d2aMtztdJrmoBH/+ikLewVCYQqOPtkS12DPluTKotU735K1Ux0/XJY
 +ELg446fYuOwPih5qp0kSXanYkT3V9uKjtqAcwOV//knp/8RGOmmxlk2oZOcaFQlWW
 2Yw3OQSy4TM7bXkxSks6U217qIffzkU2wCzhn1QO+2k2OJOQrAO839ZuvIYbbIT6DS
 VK+8SFCM2GYzg5o8jQx6nCH2gmpBkL93aTGa9opC/iHYLaEa/dtsNFoY+vkVL5k64R
 hjPMTIuj5kqUzwWrsGWao5LFR0919mb88v1PlDu1CAP/ItKSwYs1KBqECsiF0J+l2K
 ycHDPUMoPSzS4h7h/qr1u6qq/VjOLiJrLYT4mnGVzeIoHj8HSwaclSI4W6By7a4vH8
 dcyz5aFuf+wTBiemSup/FF9E=
From: Aymeric <mulx@aplu.fr>
Subject: network unstable on odroid-c1/meson8b.
To: netdev@vger.kernel.org
Openpgp: preference=signencrypt
Autocrypt: addr=mulx@aplu.fr; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
Date: Wed, 19 Jun 2019 22:18:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_131902_228952_6BA116C3 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============8654952591999055435=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8654952591999055435==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wRpdc7aNamnn3aaDx314j8th9RqUA7EE7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wRpdc7aNamnn3aaDx314j8th9RqUA7EE7
Content-Type: multipart/mixed; boundary="4nGfLzgvZoVW9yYu23sxNdDF84niVQwNk";
 protected-headers="v1"
From: Aymeric <mulx@aplu.fr>
To: netdev@vger.kernel.org
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Message-ID: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
Subject: network unstable on odroid-c1/meson8b.

--4nGfLzgvZoVW9yYu23sxNdDF84niVQwNk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello all,

I've an ODROID-C1 board (a meson8b/S805) and I've some network
unstablity with current mainline kernel; as time of writting, tested
5.0.y, 5.1.y, 5.2-rc4 and didn't try with any others versions.

After a few talks on linux-amlogic mailing list, I've been pointed here
to find and, hoppefully, fix the issue.
The whole thread on linux-amlogic is available here: [=C2=B9]

A short summary:
1. With Kernel 3.10.something made by Hardkernel (the one from the board
vendor), the network link is working at 1 gigabit and stay at 1 gigabit.
2. With Kernel 5.0.y, 5.1.y, mainline, the network link goes from up to
down every few seconds at 1 gigabit (making the board unusable) but is
working fine when forced at 100Mb (using ethtool command).
3. The ethernet cable is not the cause of the issue (see #4).
4. After a few more check, I was able to narrow the problem. It's only
present when the board is connected to my "internet box" (a Livebox
3/Sagemcom) but not with a "stupid" d-link switch (both have gigabit
capability).
5. With the help from Martin on linux-amlogic I've tried to disable EEE
in the dtb but it didn't change anything.
6. An extract of the dmesg output grepping ethernet and meson is here
when the issue is occuring: [=C2=B2].


And the last comment from Martin and why I'm sending a mail here:
- the Amlogic SoCs use a DesignWare MAC (Ethernet controller, the driver
is called stmmac) with a Relatek RTL8211F Ethernet PHY.
- there's little Amlogic specific registers involved: they mostly
control the PHY interface (enabling RMII or RGMII) and the clocks so
it's very likely that someone on the netdev list has an idea how to
debug this because a large part of the Ethernet setup is not Amlogic SoC
specific

So if you've got any idea to fix this issue.. :)

Thanks in advance,

Aymeric.


[=C2=B9]:
http://lists.infradead.org/pipermail/linux-amlogic/2019-June/012341.html
[=C2=B2]:
https://paste.aplu.fr/?b5eb6df48a9c95b6#sqHk8xhWGwRfagWNpL+u7mIsPGWVWFn2d=
7xBqika8Kc=3D




--4nGfLzgvZoVW9yYu23sxNdDF84niVQwNk--

--wRpdc7aNamnn3aaDx314j8th9RqUA7EE7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCAAdFiEETiI6EfJhbwvCiNOQrZuYhZ0O7KcFAl0KmK4ACgkQrZuYhZ0O
7Kd7MQ/+LGRd/cK1PMKhA+H3B9HYGAQMlFegteNAeT4LbO1Lw0VSRigmCysIv1aj
4piJ+Bxyj6+wGN/MYV8ur3ExXSsTdSPFqSwCVpCjVzX3aUensefTUjIpVPfq1voX
LA/5J/q9YdpP9X1RQa8rK7nO5pzrzv3meaPFwc/QC7VDtClu8MwxI5v784ShsAUr
3owg+pKDdh4W3HpPmkfG6wKdbRDDrFp5k4fCg65LZFuZuUuK0lRopfsSt7945mPs
pVVFa1DOusSF61hfPysss3Dl4x8CIBVhcvRgKoaYcO2JRI1CgrjHi8HXXUFMctzY
MZfI7kNGlFb/ryAZlF1TPbZlHuIhWY9vi+vhHwy6Cdu9mstrIpRbnozrPpAiVHMt
HaXjPsAn62rjh1oFPNw4AxQLv1kXxV85pKVzGXINz9UdbbgI5KQZdpdDb3vavzBh
cg2oWgFBj2gz1223g9gGtOzY5BH9RLyuPuoVvX29au6YABkrJFcb2y/x/3c8JuX+
vmn00PFXWoXM6inCUA/r+clok8uVrMTDUiZoxzcSV5Q0InrZminXGw3jwvjlEXMG
7C0XT04nRuqmM4js5mlolztdFd9gVJs23LRHAynTFsuBYo7uwKeFh9KljzAz8v31
kuqu1M7+CtIkC4d7fG4m2VruoOHEW4L63AzSgTEeRycnPH+AC0Y=
=jdsN
-----END PGP SIGNATURE-----

--wRpdc7aNamnn3aaDx314j8th9RqUA7EE7--


--===============8654952591999055435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8654952591999055435==--

