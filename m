Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890ADF8FA99
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYIH3KoAtHh2M/lJVlMRkVAn9jEpfGV0YqX3jEotH9Y=; b=Gtb/J32/0J+Fye
	0L3zvcEzZG7VjIkAKOZ/txmTJklPhwaZoiJnclbWl1uaJCg68ilxOVBcOYsFtDvnee8HpKwZMzfUr
	vb8ZcZNI8lIHxFQ6bXFNtg+A/AOxetPSEvw1/lza9B976hry1H58AIadVVsXyV4b8RW+Bt3bapX+m
	3o534/IR0e9O2Nsp9T3MV4ZyPDLqOy6MtW15/scYk1R5982v8A3Jcqin7IwHBcSEoEt4I24t79dIs
	2WqBlCNtgBKoWJCpTlbW+4RqRugmb7VgRe5bumTw67oyvmXJWJvvWlS23hJjX4BaoNg+ifwarpnHB
	q3SyJBarWMylWT4eSfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQE-00000008rPN-0oKk;
	Tue, 21 Apr 2026 15:53:58 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQ7-00000008rMG-0SWT;
	Tue, 21 Apr 2026 15:53:53 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63LFrUM02501267
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 21 Apr 2026 17:53:36 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63LFrUM02501267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776786816;
	bh=WIlhNTzKsCB00RviRSN9okriwm8fA8WhY7qfbKDRh8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/laOcqgkWslLprovQANgZEaEi8tzj4Ns/6LGF5Agg/4dZUkJXhPMe46UW0s2b7pD
	 Us2VRAwvVSRI+TeEG9m3O5yNibnlJtwe0i8o/4c5QElE85X61EJ+tGKtN/U4McKDSP
	 q+yD6tJhoUP8YCbDwV3wElwbITR7I+qC5qCUCo+Y=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for Amediatech X98Q
Date: Tue, 21 Apr 2026 17:53:27 +0200
Message-ID: <20260421155328.26359-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085351_936279_F7A65AF2 
X-CRM114-Status: UNSURE (   7.45  )
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

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxjaHJpc3RpYW4ua29ldmVyLWRy
YXhsQHN0dWRlbnQudWliay5hYy5hdD4KCkFkZCB0aGUgYm9hcmQgYmluZGluZyBmb3IgdGhlIEFt
ZWRpYXRlY2ggWDk4USBUViBib3gKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2
dsOpci1EcmF4bCA8Y2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ+Ci0t
LQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgfCA3
ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCmluZGV4IGE4ODUy
NzhiYzRlMi4uYzAxNjdmYmMzMTBhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbApAQCAtMjQ4LDYgKzI0OCwxMyBAQCBwcm9wZXJ0
aWVzOgogICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsczgwNXgyCiAgICAgICAgICAgLSBjb25z
dDogYW1sb2dpYyxzNAogCisgICAgICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1s
b2dpYyBNZXNvbiBTNCBTOTA1VzIgU29DCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gZW51
bToKKyAgICAgICAgICAgICAgLSBhbWVkaWF0ZWNoLHg5OHEKKyAgICAgICAgICAtIGNvbnN0OiBh
bWxvZ2ljLHM5MDV3MgorICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsczQKKwogICAgICAgLSBk
ZXNjcmlwdGlvbjogQm9hcmRzIHdpdGggdGhlIEFtbG9naWMgTWVzb24gUzQgUzkwNVk0IFNvQwog
ICAgICAgICBpdGVtczoKICAgICAgICAgICAtIGVudW06Ci0tIAoyLjUzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
