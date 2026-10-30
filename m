Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90129606A33E
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AfKOiOnZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NZ1D+MNz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KSlSRwEF86Vn+ccEZGrbwSKVnFTMwjA/CxL835JwWgs=; b=AfKOiOnZdqcIuuIbN0PjmDB8AC
	gzX6nCqitzVRsPdYuuvmnjkZpMlwTUG9o3EK3yXZsEp2rj7x0WyEoIKQAdvdLfuwG7WIMntYDAHvQ
	6ew3NvcxEgvVnjuwGwCF7zHiprCu0oZ4ogYyHFymuO0LmqWqBY3CmcK374cPojr79imYY0ykBwhbC
	Sxjr9y4PjrHBeuzGLwqTI9OaouuJbeWTnfKp6jOtajcflBwf4EDgWBpxa6rjcsTqAGw22XliDx5qt
	aBZ4S8JBTQBnYkBRAdAQWvCD8LNzvbelpVlCFPOGYSGuFzHJEh4ovTrf8U38Z0Qal3IOa/kHND+SZ
	GlH540oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXB-0000000C8AH-2EYJ;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpX8-0000000C88H-1dKt
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 16:32:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48bbb06e746so470345f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377967; x=1793982767; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=NZ1D+MNz0Hnuv4Yzt4SRCAomO8plys7cEX2PlTZQcFllOUTIqu1jAoihZW4Dfrah3s
         et7txwDdefftsX0VevKiGv4/FspK4H+nDD03k4jK3cMcoq28fTPlcNg8YtJ0kvRWoWZk
         636iFbTk8FWtWNk/u1CuS5FaYaBJh44ibLVGvtoU+wkk1j75LIAsGbQ//wtVdD8yQqs6
         gE5gOsxJZJQDOHj3LGwfh9L0hDtb6BCfBvQywvmFWWHHN9wa4RWIcr2z9Epugwi8hQrz
         Q3i6dcvI+c/v7eEamU5kkUQVVsplyJzW6p040+720LojzyYoWP/Hbdx6ftyk0EwVyQjJ
         1qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377967; x=1793982767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=TUwY1akBPmkDO0AZ7cIivb8SX4e5WZtHIKC4GF8DvlP6/ZLvHzQsf3UHXc8Ub20hA2
         LX7zkesMRgNJYcrJu4e/Iala2oznS/bIUdUbxLxBS1kimOoi+K2zSrsq25UIzaajc34T
         HWtBzj2wWsUhQaLYTVmCbrBCyg7oaO1oMdEe0QT7ytPZj9vLL+QijIxgP0ZUFHoRUBSH
         PDhTo5lTSfFWdP+4NtWTusET3PQsCZMrY6Le/5k54Fb6Heb8F4ShQhNxHJg8tob0s327
         iHes7mQY0gqSVEcY9qYD1S+otlXvnrIgB6nO/BGHDsfDoiRNCnKX/BNFe3Iy8xxri9mw
         3dkg==
X-Forwarded-Encrypted: i=1; AKwUvByi3B7cN6cHJZ6B3cLIJ4snjxBq9qACBeJ087GRB1rjja9tvBaqr4ghmHWqr+vjx57nv5xIf94abbLhP8oP@lists.infradead.org
X-Gm-Message-State: AFq9FYJO/mFTR4cMDy7CRw9OQuvsGxkYMzh5VgFd2MnNh9BgY8LQh413
	a8W4fYPtDo4ndSE7JVnuevn9rFSoQ4rOwVfxyYFQG0J+oyCLHCPZM+eby5MNhbe5ySA=
X-Gm-Gg: AYBFou2w6iZQ1sXdif0izmPZ6jsGGlmXlA4L1a2c24D0QbSnnBpWwQIdLsWbOL3WuFU
	vQ5Xy+8IML7pl+a0m/Fobfc23+HlCIDeGisGHR2AXPL8M60dpTDLXCHbxFAu/tmVUszc/CXCLzv
	Qezk6CGaq64qfB5wf5/xPXEBOmdeEO64dfEz8uxO5kJy/KHbkJ9JU6RLTm5FssP10PwIDgZmKBK
	wj0elyfRhcFYrZkh5+c3Ke8inewjawM/r+tFhInVV5F3XUGb8vYOOgJOyJBOJWPZJQxHgSTmhxF
	XebegvEf6pe3jq6OKkDuvVHty2Aa3++MotEGYDd+rDNjIpcJdK9zB4AA0GDaOpTSKdkGXz+BGVA
	hOw5nICXGNNfKPaFq9gWgcwl9JnSC81ZHZiKZfvMlXO5/kODBRZbz8yxqYxJNd8IKCZ1eV92yW/
	RQ+VZq6N7KGfGV+6IcMdBCND/xBj+49S4bs2Xw2LRMo5bCDLBpc6aALrAIZ8S9jTeqQiu1xtbjP
	rWYz2wavNtYwvKksUYlDESXvnVZojqemHMB684Wc/sNtOBZ0ekjwzKU0dsvk1P5k550kgxG+cOa
	sf7S5KLJLv8+zN9j1Rj6+kZkAun7O3X/QsUA92Wd16JiA+JIsEsfx0G+kE9+RvhY+mCnYA==
X-Received: by 2002:a5d:588e:0:b0:48e:6bbb:c3f3 with SMTP id ffacd0b85a97d-48e6e2fd071mr6553038f8f.28.1793377967347;
        Fri, 30 Oct 2026 09:32:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm3528697f8f.59.2026.10.30.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] ASoC: meson: card: fix driver remove
Date: Fri, 30 Oct 2026 17:29:52 +0100
Message-Id: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQBAEvxLm7ICbiFG/Ijlkd9s4gpswk4gQ8
 ndHPfShaKpWMqjA6FKtpHiJyVgcwq6idO/LAJbsTPW+PgYfP2Fj4dRrZsUgNkP5Ju9l4ibE9nx
 qcnuIgdyfFH782tfuz7bEB9L8DdK2fQA9Y8sMfQAAAA==
X-Change-ID: 20261026-meson-card-register-fixup-31b7983d74b1
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fXalk+osyG8+ZDMUyak0NQXBdifxrSPFw4QoLcm/1KM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq27xpM6JbNrbZS+3gUH2UWJRwWXvzs54T53dvrNP
 OsuwaMqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhI83FGhmOy6VOFZrpkt/9+
 JvZO33RJ8RuX5D19jk84d99jdl62dDUjwz/NL/wOz9/2mnOfb741b3nRzpd8yhcs538x/+P47b+
 dDAcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093250_454085_72240060 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

meson_card_remove() reads the wrong drvdata and frees the card links
before the card is unregistered, which crashes when the driver is
unbound. Fix both.

---
Jerome Brunet (2):
      ASoC: meson: card: leave the device drvdata to the ASoC card
      ASoC: meson: card: unregister the card before freeing its links

 sound/soc/meson/meson-card-utils.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261026-meson-card-register-fixup-31b7983d74b1

Best regards,
--  
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
