Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A02860A262E
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OxiGOPOq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QpAgwFWz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7pLIQEVxI/tjztaJfEqzJ8VUkBIPN6/4CQKusrrCBqE=; b=OxiGOPOqARsX+I8dPqnlatW9ZF
	o7aRDi/s0vNGVtCja+9lTv4NesBWpZmunyA8JHTfRhMo9A4PcC4jV7io+uW+nLaiq8RAlydKnqVrM
	3x5cQKe/tadKtwzAn65OqjTM+V+4VmWLm3Kn5t7jJQWDTCOhLxkN1tuVZnR/Z+ZDQ5FSQ2KzlACOM
	g6SnS9joJfkSi8RqnRjXS32FG68dUnw9P6QUkLkJgRl+3hi1XQJ+Sd5SoV/bdhKqfwkE5grlWQvs3
	877laGxJIH/p+uzyKeoXwVQQhHWZPYtlrgMnUFOoVfxK5o3KOyBF2lwB81ZVnYoZ4Br5N3BqtuDcc
	zEIXg7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pe-00000001MuH-07nx;
	Sun, 25 Oct 2026 19:24:38 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pX-00000001Mkm-3rkM;
	Sun, 25 Oct 2026 19:24:33 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ie518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:18 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ie518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956259;
	bh=SeMk/djFpll7ZlqK1Xj5r+CEpbpIWtTIPN8oDjZMJfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QpAgwFWzHpoyZPbyXyW0Jo0y9zf1jyDjIHZVgyCu+Dq8crqwZZD5Xx3E868wM7ouz
	 3ZXXQdmxfXjlrNPUp4JcX8+Cqb2lpdE2cSK2SRaBjYrThrCyfiNrzg0Eq+aBP3WpOt
	 w7fj6yZJ0B6w3EWXoTQQPRhDSoD3COoP6KRTbklg=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 5/7] ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
Date: Sun, 25 Oct 2026 20:24:02 +0100
Message-ID: <20261025192404.209695-6-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122432_166574_3E2F06A7 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+CgpUaGUgUzQgSERN
SSBUWCBnbHVlIGhhcyBzZXBhcmF0ZSBkYXRhIGFuZCBjbG9jayBlbmFibGVzIGZvciBpdHMgSTJT
CmFuZCBTUERJRiBwYXRocywgc28gaXQgbmVlZHMgaXRzIG93biBjb21wYXRpYmxlLgoKU2lnbmVk
LW9mZi1ieTogSmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+ClNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRl
PgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FtbG9naWMsZzEyYS10b2hkbWl0
eC55YW1sICAgICAgICAgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hbWxvZ2lj
LGcxMmEtdG9oZG1pdHgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9hbWxvZ2ljLGcxMmEtdG9oZG1pdHgueWFtbAppbmRleCBiNGI3ODQ3NWM1YjguLjAxNmQz
Y2QzZWIwMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL2FtbG9naWMsZzEyYS10b2hkbWl0eC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9hbWxvZ2ljLGcxMmEtdG9oZG1pdHgueWFtbApAQCAtMjIsNiAr
MjIsNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsZzEyYS10b2hk
bWl0eAogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0g
YW1sb2dpYyxzNC10b2hkbWl0eAogICAgICAgICAgICAgICAtIGFtbG9naWMsc20xLXRvaGRtaXR4
CiAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxnMTJhLXRvaGRtaXR4CiAKLS0gCjIuNTYuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
