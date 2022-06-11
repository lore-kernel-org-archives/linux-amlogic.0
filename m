Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B740C43334
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jun 2022 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ovb1XLmb/2C/Xtt4T++hfFN8zS6B6faQgkgrjELe4Z4=; b=zFjZEfAxn0ClKA
	So1wwGoLsYFzH8WRDOyV/Y98oSTM+1Lt1fG+jJ3F68cjmQE7E+G8xV6V8nw3aYUSFPhEDMpxCyN7p
	I9fT9NxSF7XC6rn6yRlutqh4aO/1Rosba7bORyzkbH5V5qBjKUxAfrnYAUqOfqq271nVn0GonGgLi
	M7BeaU4r39tYjlnud6jUh9dSgsulqBiyk9EqfC/l8rZr19f0Arji7/bJEmXGdKVT+iluOukblQlDZ
	MbdsJtWv/swrdk3a3segU/C8M5yFozTR9l0kRZtXwhjpQd2qcsd86qBUDeRIdM4vGFwnHumYp2opK
	ofNXU3QsXNJLN9WSCdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzuwD-00Biq4-3j; Sat, 11 Jun 2022 06:49:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzuwA-00BioW-2a
	for linux-amlogic@lists.infradead.org; Sat, 11 Jun 2022 06:49:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q15so1049732wrc.11
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jun 2022 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=2mnLJx/YLtGg6XB3yrCKXBONKfuMv1V1OCyuSTcWLew=;
        b=UEHygF8XU7HI1eHnGVcveKltbaP0GmmI92POtL5a6zilfHSvYYnTKPrt2HU021uGSd
         G5IDJoCyRnSK7IDadSVPwtjewfuk/1I2Zw1/FgHm7iE31gWkzUBjUIHjqFA4a6Uwbgsm
         hPUFrdYQlzW5YipDjGielnHHQjziwUkm+6TRoZXYs0PM5JIL4bi3ra9k4tnOt9sSnzqT
         Amy17oPNgWQcnWaJs+dJXZgRIUv9IOFNCxH9EyWss/X1mauFtGSKxdw7iIB7bmkNxTuV
         wurBKBOBfmNNkJE0RcTB5P3edmQdmCz3wlGjgQgoUERW/Fl/t2JhZ89k9TQtjPBQHKZD
         LudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=2mnLJx/YLtGg6XB3yrCKXBONKfuMv1V1OCyuSTcWLew=;
        b=0kKfJYrQFMiNzQygwyFNhwg3jW3QzjmG0cYfZsre3fh7a3E2nGNl3UMtuniQDteUYf
         5nY18pY+i97DV9QcUe+Bttf7hcdHnbz2yAPiBFrzsUThaw8CyHEMjA/sdzvQx1KNrY4I
         /uyGKNSPAZlgUHb87hYNvo9dDNhddCTYYiq646bajId7rbTjWahY2mxcrzAzNQeeUrHv
         qBMQMJtyOq4GvEQ85quyCDWTPjOldb4jxQRehxLpXAirIq3gC1vtCSvPI/rLHgL/JIka
         vQTbjvTSsh8Y2kpRsiWHNhl+upnxA9X4nu7ZPATVhHfAEJEucq79qC9r7Ct1uTECT+tZ
         ReyQ==
X-Gm-Message-State: AOAM530RsDrEU+oKIYZn+zFQZTGErZGOR93cw6xuiaRA9vvbIVCzzoVu
	Jj3ZzEN/fuW0F1rSRZrS+QE=
X-Google-Smtp-Source: ABdhPJxHNyWOzUNETd/M21rDxElmX7TvMc2ZdG8j8u5bGnHDc5kubegQK/UQxGq7RhBoJ4IviPS9Kg==
X-Received: by 2002:a5d:4c47:0:b0:210:2f9f:a21b with SMTP id n7-20020a5d4c47000000b002102f9fa21bmr48064948wrt.493.1654930168120;
        Fri, 10 Jun 2022 23:49:28 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id k11-20020a056000004b00b0020d02262664sm1580865wrx.25.2022.06.10.23.49.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jun 2022 23:49:27 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Regression in 5.18.3 from "xhci: Set HCD flag to defer primary
 roothub registration"
Message-Id: <743F7369-2794-4189-8891-5DA62E4B62DA@gmail.com>
Date: Sat, 11 Jun 2022 10:49:23 +0400
To: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Chris Chiu <chris.chiu@canonical.com>,
 linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_234934_159068_FA4E7EF8 
X-CRM114-Status: UNSURE (   4.79  )
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

Q29tbWl0IDZjNjRhNjY0ZTFjZmYzMzllYzY5OGQ4MDNmYThjYmI5YWY1ZDk1Y2Ug4oCceGhjaTog
U2V0IEhDRCBmbGFnIHRvIGRlZmVyCnByaW1hcnkgcm9vdGh1YiByZWdpc3RyYXRpb27igJ0gYWRk
ZWQgZm9yIExpbnV4IDUuMTguMyBjYXVzZWQgYSByZWdyZXNzaW9uIG9uCnNvbWUgQW1sb2dpYyBT
OTEyIGRldmljZXMgKG9yaWdpbmFsIHVzZXIgZm9ydW0gcmVwb3J0IHdpdGggYW4gQW5kcm9pZCBU
ViBib3gKYW5kIGNvbmZpcm1lZCB3aXRoIGEgS2hhZGFzIFZJTTIgYm9hcmQpLiBJIGRvIG5vdCBz
ZWUgaXNzdWVzIHdpdGggb2xkZXIgUzkwNQooV2VUZUsgUGxheTIpIG9yIG5ld2VyIFM5MjJYIChP
ZHJvaWQgTjIrKSBkZXZpY2VzIHJ1bm5pbmcgdGhlIHNhbWUga2VybmVsLgpUaGVyZSBhcmUgbm8g
a2VybmVsIHNwbGF0cyBvciBlcnJvciBtZXNzYWdlcyBidXQgbHN1c2Igc2hvd3Mgbm8gb3V0cHV0
IGFuZApub3RoaW5nIHdvcmtzLiBTaW1wbGUgcmV2ZXJ0IHJlc3RvcmVzIHRoZSBwcmV2aW91cyBn
b29kIHdvcmtpbmcgYmVoYXZpb3VyLgoKZG1lc2cgd2l0aCBjb21taXQgaHR0cDovL2l4LmlvLzNa
VHYKZG1lc2cgd2l0aCByZXZlcnQgaHR0cDovL2l4LmlvLzNaVHcKCknigJltIG5vdCBhIGNvZGVy
IHNvIHdpbGwgbmVlZCB0byBiZSBmZWQgaW5zdHJ1Y3Rpb25zIHRvIGFzc2lzdCB3aXRoIGRlYnVn
Z2luZwp0aGUgaXNzdWUgZnVydGhlciBpZiB5b3UgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gYW4gQW1s
b2dpYyBTOTEyIGRldmljZS4gSSBjYW4Kc2hhcmUgZGV2aWNlcyBvbmxpbmUgZm9yIHJlbW90ZSBw
b2tpbmcgYXJvdW5kIGlmIG5lZWRlZC4KCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
