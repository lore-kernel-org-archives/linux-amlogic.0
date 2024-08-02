Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FE5C52D70
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Aug 2024 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+oxpvVPN7+h+pJO6Dk0tGnXSFp4ak9iIv0hb7wFEFo=; b=csHQEo1PF28EED
	LHws7Lqi3xhSPERnyM2LZ1Mo2ApfPgrQAjaJunq6CoKCTKdeHT4X1m5u161pRF8pZDAiU4yNVIl8i
	QAs8wS+EoQbpgvwRGFQDMslaoFQDezChHdhjph1uwm3m29unobrXseUm+AT1PmHHlwt6mzr4BPoSn
	jeow0iFwPYWF0QaBNJov+VWendJRNjMDBq30gQvKXavMkFKLP3W0xXX9BtxEaCNQKEFZDETO3vMIk
	qiHdjmORY4a6bAuguZZ5wQGGYgDNAnX2r/caPPHMeUdcofKbolvkZmuyxj3DdCGjxpWCGAgWZsRZ8
	cot3Ij9K7k9yGh+hGEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmlS-00000007xVo-0S5r;
	Fri, 02 Aug 2024 07:31:50 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmlP-00000007xUB-3IbD
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Aug 2024 07:31:49 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 5B664259AA; Fri,  2 Aug 2024 09:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1722583906;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=Uk9FUG2ZhHogxQ5ZDtVo6T1+e+DU1uOfcMQM63WV54opNHieaN4dlLaL5YAiPbGIW
	 usA0NkdMAEogStqBwteWYF9c9YURp+niIPmSYW5ukzgkMTrfhURzJv1GrKgekca3G9
	 B+wrM+2whhC0GJZmU6E+ZNEj4OOmy1m+S+31Hle6994AkSjCsLOV6sJIKLj+Q0B8T3
	 5WNKZEP8+JnFzvYPNLuNxSgBn/+uLp8iT3xLx5cA22FEfeTMVpNRmOuLyJa8uGjl7p
	 RhwH9hhIiuRAhS/RZARpxkR7Ho+TwMTDSJbMIA3mS5Yz5eE3DlbfXlRA5FjanTxyhc
	 DfUo1H8VjpX0g==
Received: by mail.synergyflux.pl for <linux-amlogic@lists.infradead.org>; Fri,  2 Aug 2024 07:30:58 GMT
Message-ID: <20240802084500-0.1.d4.39h4j.0.mcl2a25606@synergyflux.pl>
Date: Fri,  2 Aug 2024 07:30:58 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_003147_989676_9D787639 
X-CRM114-Status: UNSURE (   0.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
