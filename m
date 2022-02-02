Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49169C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Feb 2022 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VwyYAtmHocNl76Ozhpj3eSCGcTph3H1nOGWA4vXfG3k=; b=VHs
	Vrk0qaguHiH9PRB0ONmffBoMknji/A87O+4ccYO1x5roU/SGbeptDr7W7CMpcntPUZnEvFJeTXn+Y
	1vG1eU2q8Osyil06Zt6igz32rx1RG9omND8GbQdFtU37GXwOEZArhv/rxrrSgpIvWxQUxuwRAAwtX
	I8Shxt/E78eLszo085f1N0iNJ+937uSbrncO6MW79HBIelRTWJwlwea+a9xzn0n7pGk0iF4HrR+13
	3iSPFexn7ITrYfv5nU/fhq8aFDQYmdBVDcFHTdB5oPlcMegdYJNW8sCOk/GQdcpR1EPoyujLq6FY0
	fvMZq4OcyGxT488frwLZ9NMmnHgD/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFM5N-00Gn0e-6W; Wed, 02 Feb 2022 20:18:37 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFM5J-00Gmzt-Ss
 for linux-amlogic@lists.infradead.org; Wed, 02 Feb 2022 20:18:35 +0000
Received: by mail-yb1-xb36.google.com with SMTP id g14so2115883ybs.8
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Feb 2022 12:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=FfUHJtnMrup0bTy5QIVCTjRbmyyUJk08CV6nq2NKHqg=;
 b=TLwLI1/8D+wB+/Wr0I0gHd39+JvOlc6CWnC6LZy/7NWtelzTUJ37jQyubuCUPyXQXw
 m2c4jPqDfnK1Rlkw36QQPhLf6JyHcM+bSVMYjRMsQF35Alb/hPRJnW9VgxjwSBAnLVc4
 GwPwq/QFjLpRG7YfPYB2TGOO5l6xrjdDibInCm1zP+6QDi0WOcZ6DlOROlnQUUc1ChCQ
 EDR6r9o4+3T8voDjGpsjIf2OSw49Dcj6LUQSonHlmtc0Gse4DudkA3Ng8HMi0o1NkBH4
 QFRxhYxvOhmRMp9A+Gf00OL8NIMSAMsnXNNxwSMmGgEHlzhqNPNaHuJnUDlNxD7HPb+5
 fFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FfUHJtnMrup0bTy5QIVCTjRbmyyUJk08CV6nq2NKHqg=;
 b=mUZ7KsQFRKnGmKysZ9qBYUcdeXAW/SHrhJGMml2JvibZH44PvTA7lKPzaBZCHxHz6h
 fPM2g3yi5IX17BJ6ldnD33I6J6hX1xvnY4UysWJ9ZW4iBO8dvQcTJtsvNoU+m5VgS9B3
 lp5SQrhX5XEPuBUhtJUjnx0TxNjd8NwYKoac5TOwxxHvz5XY2B7idLPING0ZXTAw6pHT
 5PvOwdfd6+9iL4vPdSzHFkCVl+9kN3lSNQZJcuiK+0djdVljAKUMiIamJSeaGSp8l9CF
 iVBZpPrdWaOoSbIvv+exUw7eXEfqahs7vIcme6R539KM4G/436yRiNdrhIDO0EddQR1C
 SdOg==
X-Gm-Message-State: AOAM532ZfTHQWrfg+c89lRl7MtXoo2u05uFL3lFSCFdCQerD50eSvxX3
 Fbbrix/eOOR+F+8ITGDy7zoHkKQxotXhIYprWyg=
X-Google-Smtp-Source: ABdhPJyL4pIDzAMFYfRocB+O88iiha+++LBpNHA2QnoO+pdIe//+SkDgQYnCHznsEOfX2wkIS0ogi0JCDKTJMMV5ZV0=
X-Received: by 2002:a81:84:: with SMTP id 126mr2163168ywa.80.1643833112144;
 Wed, 02 Feb 2022 12:18:32 -0800 (PST)
MIME-Version: 1.0
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 2 Feb 2022 21:18:21 +0100
Message-ID: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
Subject: net: stmmac: dwmac-meson8b: interface sometimes does not come up at
 boot
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_121833_980541_DFAF8B80 
X-CRM114-Status: GOOD (  12.91  )
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

Hello,

I've been tracking down an issue with network interfaces from
meson8b-dwmac sometimes not coming up properly at boot.
The target systems are AML-S805X-CC boards (Amlogic S805X SoC), I have
a group of them as part of a CI test farm that uses nfsroot.

After hopefully ruling out potential platform/firmware and network
issues I managed to bisect this commit in the kernel to make a big
difference:

  46f69ded988d2311e3be2e4c3898fc0edd7e6c5a net: stmmac: Use resolved
link config in mac_link_up()

With a kernel before that commit, I am able to submit hundreds of test
jobs and the boards always start the network interface properly.

After that commit, around 30% of the jobs start hitting this:

  [    2.178078] meson8b-dwmac c9410000.ethernet eth0: PHY
[0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
  [    2.183505] meson8b-dwmac c9410000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
  [    2.200784] meson8b-dwmac c9410000.ethernet eth0: No Safety
Features support found
  [    2.202713] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
  [    2.209825] meson8b-dwmac c9410000.ethernet eth0: configuring for
phy/rmii link mode
  [    3.762108] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
100Mbps/Full - flow control off
  [    3.783162] Sending DHCP requests ...... timed out!
  [   93.680402] meson8b-dwmac c9410000.ethernet eth0: Link is Down
  [   93.685712] IP-Config: Retrying forever (NFS root)...
  [   93.756540] meson8b-dwmac c9410000.ethernet eth0: PHY
[0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
  [   93.763266] meson8b-dwmac c9410000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
  [   93.779340] meson8b-dwmac c9410000.ethernet eth0: No Safety
Features support found
  [   93.781336] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
  [   93.788088] meson8b-dwmac c9410000.ethernet eth0: configuring for
phy/rmii link mode
  [   93.807459] random: fast init done
  [   95.353076] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
100Mbps/Full - flow control off

This still happens with a kernel from master, currently 5.17-rc2 (less
frequently but still often hit by CI test jobs).
The jobs still usually get to work after restarting the interface a
couple of times, but sometimes it takes 3-4 attempts.

Here is one example and full dmesg:
https://gitlab.freedesktop.org/enunes/mesa/-/jobs/16452399/raw

Note that DHCP does not seem to be an issue here, besides the fact
that the problem only happens since the mentioned commit under the
same setup, I did try to set up the boards to use a static ip but then
the interfaces just don't communicate at all from boot.

For test purposes I attempted to revert
46f69ded988d2311e3be2e4c3898fc0edd7e6c5a on top of master but that
does not apply trivially anymore, and by trying to revert it manually
I haven't been able to get a working interface.

Any advice on how to further debug or fix this?

Thanks

Erico

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
